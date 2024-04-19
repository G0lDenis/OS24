#!/bin/bash

sort -t: -nk3 /etc/passwd | awk -F: -e '{printf("%s %s\n",$1,$3)}'
