#!/bin/bash

IFS=$'\n'

for i in $(ps ax --format pid,start_time --sort start_time | tac)
do
	if [[ $(awk '{print $1}' <<< $i) -lt $$ ]]
	then
		echo $(awk '{print $1}' <<< $i)
		break
	fi
done
