#!/bin/bash

for fold in $(ps -ao ppid)
do
	if [[ $fold -eq "PPID" ]]
	then
		continue
	fi

	let time_user=$(cat /proc/$fold/stat | awk '{print $14}')
	let time_kernel=$(cat /proc/$fold/stat | awk '{print $15}')
	let time_ch=$(cat /proc/$fold/stat | awk '{print $16}')
	echo $fold $(($time_user + $time_kernel + $time_ch))
done | sort -k2 | tail -1 | awk '{print $1}'

# to check top -> press x -> choose column TIME+ -> checked \/
