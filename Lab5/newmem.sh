#!/bin/bash

declare -a memdrop

cnt=0
while true
do
	let cnt=$cnt+1
	memdrop+=( 0 1 2 3 4 5 6 7 8 10 )
	if [[ ${#memdrop[@]} -gt $1 ]]
	then
		break
	fi
done
