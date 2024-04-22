#!/bin/bash

dir=$(ls -d $HOME/Backup-????-??-?? | sort | tail -n 1)

if [[ -z $dir ]]
then
	echo "No backups found"
fi

if [[ ! -d "$HOME/restore" ]]
then
	mkdir "$HOME/restore"
fi

for path in $dir/*
do
	if [[ -f $path ]]
	then
		if [[ ! $(basename $path) =~ \.[0-9]{4}\-[0-9]{2}\-[0-9]{2}$ ]]
		then
			cp $path "$HOME/restore/$(basename $path)"
		fi
	fi
done
