#!/bin/bash

if [[ ! -f "$HOME/.trash.log" ]]
then
	echo "No log file found"
fi

last_ifs="$IFS"
IFS=$'\n'
regex="$1"

for line in $(grep "\b$1\b" "$HOME/.trash.log")
do
	echo "Do you want to restore $(echo $line | cut -d' ' -f1) ?"
	read -p "y/n " choice

	if [[ $choice == "y" ]]
	then
		if [[ ! -f $(echo $line | cut -d' ' -f2) ]]
		then
			echo "Link was not found"
			break
		fi

		dir=$(dirname $(echo $line | cut -d' ' -f1))

		if [[ ! -d $dir ]]
		then
			echo "Dir not exists"
			break
		fi
		
		new_name=$(basename $(echo $line | cut -d' ' -f1))
		if [[ -f $(echo $line | cut -d' ' -f1) || -d $(echo $line | cut -d' ' -f1) ]]
                then
                        echo "File already exists"
                        echo "Do you want to rename? y/n "
                        read choice
			if [[ $choice == "y" ]]
			then
				echo "Enter new name"
				read new_name
			fi
			while [[ -f "$dir/$new_name" || -d "$dir/$new_name" ]]
			do
                        	echo "File already exists, enter new name"
				read new_name
			done
                fi

		mv $(echo $line | cut -d' ' -f2) "$dir/$new_name"
		echo "moved"
	fi
done

IFS=$last_ifs
