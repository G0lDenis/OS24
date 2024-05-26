#!/bin/bash

echo > report2.log

declare -a memdrop

cnt=0
while true
do
	let cnt=$cnt+1
	memdrop+=( 0 1 2 3 4 5 6 7 8 10 )
	if (( $cnt % 100000 == 0 ))
	then
		echo ${#memdrop[@]} >> report2.log
	fi
done
