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

		dir=$(dirname $(echo $line | cut -d' ' -f1))

		if [[ ! -d $dir ]]
		then
			echo "Dir not exists"
		fi
		
		new_name=$(basename $(echo $line | cut -d' ' -f1))
		if [[ -f $(echo $line | cut -d' ' -f1) ]]
                then
                        echo "File already exists"
                        echo "Do you want to rename? y/n "
                        read choice
			if [[ $choice == "y" ]]
			then
				echo "Enter new name"
				read new_name
			fi
			while [[ -f "$dir/$new_name" ]]
			do
                        	echo "File already exists, enter new name"
				read new_name
			done
                fi

		mv $(echo $line | cut -d' ' -f2) "$dir/$new_name"
	
		break
	fi
done

IFS=$last_ifs
