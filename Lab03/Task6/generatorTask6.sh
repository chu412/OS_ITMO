#!/bin/bash

while true; do
read line
case $line in
"+")
kill -USR1 $1
;;
"*")
kill -USR2 $1
;;
"TERM")
kill -SIGTERM $1
exit 0
;;
esac
done
