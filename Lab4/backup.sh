#!/bin/bash

directory="$HOME/Backup-$(date "+%Y-%m-%d")"
let new_created=1
for i in $(seq 1 7)
do
	if [[ -d "$HOME/Backup-$(date -d "$i day ago" "+%Y-%m-%d")" ]]
	then
		let new_created=0
		directory="$HOME/Backup-$(date -d "$i day ago" "+%Y-%m-%d")"
	fi	
done

if [[ $new_created ]]
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
	echo "$(basename $directory) $(date "+%Y-%m-%d")" >> "$HOME/backup-report"
	echo $files >> "$HOME/backup-report"

else
	echo x
fi
