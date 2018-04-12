#!/bin/bash -l

PROGRAM_NAME="Celones Operating System Preparation Utility"

exec 3>&1

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
