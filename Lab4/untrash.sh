#!/bin/bash

if [[ ! -f "$HOME/.trash.log" ]]
then
	echo "No log file found"
fi

last_ifs="$IFS"
IFS=$'\n'

for line in $(grep $1 "$HOME/.trash.log")
do
	echo "Do you want to restore $(echo $line | cut -d' ' -f1) ?"
	read -p "y/n " choice

	if [[ $choice == "y" ]]
	then
		if [[ ! -f $(echo $line | cut -d' ' -f2) ]]
		then
			echo "Link was not found"
		fi
	
		break
	fi
done

IFS=$last_ifs
