#!/bin/bash

directory="$HOME/Backup-$(date "+%Y-%m-%d")"
let new_created=1
for i in $(seq 0 7)
do
	if [[ -d "$HOME/Backup-$(date -d "$i day ago" "+%Y-%m-%d")" ]]
	then
		let new_created=0
		directory="$HOME/Backup-$(date -d "$i day ago" "+%Y-%m-%d")"
	fi	
done

if [[ $new_created -eq 1 ]]
then
	mkdir $directory

	files=""
	for dir in "$HOME/source/"*
	do
		if [[ -f $dir ]]
		then
			cp $dir "$directory/$(basename $dir)"
			files="$files $(basename $dir)"
		fi
	done
	echo "added $(basename $directory) $(date "+%Y-%m-%d")" >> "$HOME/backup-report"
	echo -e "$files\n" >> "$HOME/backup-report"

else
	files=""
	edited_files=""
        for dir in "$HOME/source/"*
        do
                if [[ -f $dir ]]
                then
			if [[ ! -f "$directory/$(basename $dir)" ]]
			then
				cp $dir "$directory/$(basename $dir)"
				files="$files $(basename $dir)"
			else
				let actual_file_size=$(wc -c < "$dir")
				let stored_file_size=$(wc -c < $directory/$(basename $dir))
				if [[ $actual_file_size -ne $stored_file_size ]]
				then
					old_name="$(basename $dir)"
					new_name="$(basename $dir).$(date "+%Y-%m-%d")"
					mv "$directory/$old_name" "$directory/$new_name"
					cp $dir "$directory/$old_name"
					edited_files="$edited_file\n$old_name $new_name"
				fi
			fi
                fi
        done
        echo "edited $(basename $directory) $(date "+%Y-%m-%d")" >> "$HOME/backup-report"
	if [[ ! -z $files ]]
	then
        	echo -e "$files\n" >> "$HOME/backup-report"
	fi
	echo -e "$edited_files" >> "$HOME/backup-report"
fi
