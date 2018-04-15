#!/bin/bash -l

echo 'Content-Type: text/html; charset=utf-8'
echo ''

echo '<!doctype html>'
echo '<html>'

echo  '<head>'
echo   '<meta charset="utf-8" />'
echo   '<title>Hello there</title>'
echo  '</head>'

echo  '<body>'
echo   '<h1>Hello there</h1>'
echo   "<p>General $HTTP_USER_AGENT</p>"

echo   '<table>'
IFS=';' cat osrepo/bases.csv | while read -ra ITEM; do
  echo -n '<tr>'
  for i in "${ITEM[@]}"; do
    echo -n "<td>$i</td>"
  done
  echo '</tr>'
done
echo   '</table>'

echo  '</body>'

echo '</html>'
