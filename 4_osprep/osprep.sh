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

FORMAT="text"
LOCAL=0

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
  echo "Update local configuration assemblies repository"
}

function bases {
  echo "List available base images"
}

function base {
  echo "Select base image"
}


######################### SCRIPT ARGUMENTS PROCESSING ##########################
exec 3>&1

for i in "$@"; do
  case $i in

    --local|-l ) LOCAL=1        ;;
    --format=* ) FORMAT=${i#*=} ;;

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
    echo "$1 is not a valid OS Preparation Utility command!" >&2

esac
