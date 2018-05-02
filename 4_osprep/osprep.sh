#!/bin/bash -l

# Author      : Mateusz Karcz
# Last edited : May 2018
# Version     : 0.1.1805
#
# Description : A tool for downloading and configuring boot disks of hipster
#               operating systems.
#
# Licensed under the MIT License.

PROGRAM_NAME="Celones Operating System Preparation Utility"
PROGRAM_VERSION="0.1.1805"

HTTP_USER_AGENT="Celones-OSPrep/$PROGRAM_VERSION"

NC="\033[0m"
BOLD="\033[1m"
GREEN="\033[0;32m"

OPT_FORMAT="text"
OPT_LOCAL=false
REPO_URL="http://pkg.svc.celones.pl/osprep/"

############################### HELPER ROUTINES ################################
function check_wget {
  if [ `command -v wget` -eq "" ]; then
    echo "This command requires wget, but it hasn't been found!" >&2
    exit 1
  fi
}

function check_make {
  if [ `command -v make` -eq "" ]; then
    echo "This command requires GNU Make, but it hasn't been found!" >&2
    exit 1
  fi
}

function http_header {
  # $URL    - remote resource
  # $HEADER - name of the HTTP header
  wget -S --spider "$URL" 2>&1 | grep "$HEADER: " | sed -e 's/^ *[^:]\+: //'
}

function http_download {
  # $URL  - remote resource
  # $FILE - output file name
  wget --no-verbose --show-progress --progress=bar -U "$HTTP_USER_AGENT" -O "$FILE" "$URL"
}

function download_gauge {
  # $URL  - remote resource
  # $FILE - output file name
  wget --progress=dot -U "$HTTP_USER_AGENT" -O "$FILE" "$URL" 2>&1 \
  | grep "%" | sed -u -e 's/^ *[^ ]\+[\. ]\+//g' | sed -u -e 's/%.*//' \
  | dialog \
  --backtitle "$PROGRAM_NAME" \
  --title "Downloading" \
  --gauge "$URL" 10 100
}

################################### COMMANDS ###################################
function interactive {
  tput smcup

  RESULT=`dialog \
  --backtitle "$PROGRAM_NAME" \
  --title "Build List Box" \
  --visit-items \
  --buildlist "Text" 0 0 0 \
    "it1" "Initially selected"     on \
    "it2" "Initially not selected" off 2>&1 1>&3`

  dialog \
  --backtitle "$PROGRAM_NAME" \
  --title "Message Box" \
  --msgbox "You've selected: $RESULT" 0 0

  tput rmcup

}

function version {
  echo $PROGRAM_NAME
  echo "Version $PROGRAM_VERSION"
  echo "© 2018 Mateusz Karcz. All rights reserved."
  echo "Licensed under the MIT License."
}

function help {
  echo "Program help"
}

function update {
  FILE=".osprep/cache/bases.csv"
  URL="${REPO_URL}bases.csv"

  mkdir -p $(dirname "$FILE")

  if [ -f "$FILE" ]; then
    HTTP_LAST_MODIFIED=$(HEADER=Last-Modified http_header)
    if [ $(date -d "$HTTP_LAST_MODIFIED" +%s) -gt $(stat -c %Y "$FILE") ]; then
      rm "$FILE"
    else
      echo "Repository already up to date."
    fi
  fi

  if [ ! -f "$FILE" ]; then
    echo "Updating the repository..."
    http_download
    if [ -f "$FILE" ]; then
      echo "Repository update completed."
    else
      echo "Cannot update repository!" >&2
      exit 1
    fi
  fi
}

function bases {
  FILE=".osprep/cache/bases.csv"

  if [ ! -f "$FILE" ]; then update; fi

  if [ $OPT_FORMAT == "csv" ]; then cat "$FILE"

  else
    cat "$FILE" | while read LINE; do
      IFS=';' read -r -a BASE_DESC <<< "$LINE"
      echo -e "${GREEN}${BASE_DESC[0]}${NC} ${BASE_DESC[1]}"
      echo -e "  ${BOLD}${BASE_DESC[2]}:${NC} ${BASE_DESC[3]}"
      echo ""
    done
  fi
}

function base {
  echo "Select base image"
}


######################### SCRIPT ARGUMENTS PROCESSING ##########################
exec 3>&1

for i in "$@"; do
  case $i in

    --local|-l ) OPT_LOCAL=true     ;;
    --format=* ) OPT_FORMAT=${i#*=} ;;

  esac
done

case $1 in

  ''             ) interactive ;;

  --version|-v   ) version     ;;
  --help|-h|help ) help        ;;

  update         ) update      ;;
  bases          ) bases       ;;
  base           ) base        ;;
  packages       ) packages    ;;
  add            ) add         ;;
  remove         ) remove      ;;
  set            ) set         ;;
  apply          ) apply       ;;
  discard        ) discard     ;;
  image          ) image       ;;

  *)
    if [ $OPT_LOCAL = true ]; then
      interactive
    else
      echo "$1 is not a valid OS Preparation Utility command!" >&2
      exit 1
    fi

esac
