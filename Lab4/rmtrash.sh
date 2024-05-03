#!/bin/bash

if [[ ! -f $1 ]]
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
