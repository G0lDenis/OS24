#!/bin/bash

reg="[a-zA-Z0-9.]+\@[a-zA-Z0-9]+(\.[a-zA-Z]+)+"

touch emails.lst

sudo grep -E -r -h -s -o -w $reg /etc/* | awk '{printf("%s\n",$1)}' | sort -u | awk '{printf("%s, ", $1)}' > emails.lst

cat emails.lst
echo
