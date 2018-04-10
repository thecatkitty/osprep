#!/bin/bash -l

exec 3>&1

RESULT=`dialog \
--backtitle "Celones Operating System Preparation Utility" \
--title "Build List Box" \
--visit-items \
--buildlist "Text" 0 0 0 \
  "it1" "Initially selected"     on \
  "it2" "Initially not selected" off 2>&1 1>&3`

dialog \
--backtitle "Celones Operating System Preparation Utility" \
--title "Message Box" \
--msgbox "You've selected: $RESULT" 0 0
