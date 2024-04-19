#!/bin/bash

name=$1

function check_name {
	if [[ ! $# -eq 1 ]]
	then
		return 0
	fi

	if [[ -f $1 ]]
	then
		return 1
	else
		return 0
	fi
}

check_name $1

if [[ ! $? ]]
then
	echo "No such file found"
	exit
fi

if [[ ! -d "$HOME/.trash" ]]
then
	mkdir "$HOME/.trash"
fi

file_path="$(realpath $1)"
link_name="$HOME/.trash/$(date +%s)"

ln "$file_path" "$link_name"

rm $file_path

echo "$file_path $link_name" >> "$HOME/.trash.log"
