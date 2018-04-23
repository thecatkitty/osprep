#!/bin/bash -l

# Author           : Mateusz Karcz
# Author           : April 2018
# Version          : 0.1.1804
#
# Description      :
# Opis
#
# Licensed under MIT License.

PROGRAM_NAME="Celones Operating System Preparation Utility"

exec 3>&1

for i in "$@"; do

  case i in

    --local|-l)
      LOCAL=1
      ;;

    --format=*)
      FORMAT=${i#*=}
      ;;
  esac

done


case $1 in

  '')
    echo "Full-screen interactive interface"
    ;;

  --version|-v)
    echo "Version info"
    ;;

  --help|-h|help)
    echo "Program help"
    ;;

  update)
    echo "Update local configuration assemblies repository"
    ;;

  bases)
    echo "List available base images"
    ;;

  base)
    echo "Select base image"
    ;;

  packages)
    echo "List available packages for current base image"
    ;;

  add)
    echo "Add a package to the image"
    ;;

  remove)
    echo "Remove a package from the image"
    ;;

  set)
    echo "Display or change settings"
    ;;

  apply)
    echo "Apply changes in image"
    ;;

  discard)
    echo "Discard changes in image"
    ;;

  image)
    echo "Generate output image"
    ;;

  *)
    echo "$1 is not a valid OS Preparation Utility command!" >&2

esac

echo $LOCAL
echo $FORMAT

exit

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
