#!/bin/bash

star="$(
for pid in $(ps -axo pid)
do
	if [[ $pid -eq "PID" ]]
	then
		continue
	fi
        read_at_start=$(sudo grep -Esh "rchar" "/proc/$pid/io" | grep -Eo "[0-9]+")

        echo $pid $read_at_start
done
)"

sleep 5

IFS=$'\n'

result=$(for str in $star
do
	pid=$(awk '{print $1}' <<< $str)

	if ps -p $pid > /dev/null
	then
        	let read_finally=$(sudo grep -Esh "rchar" "/proc/$pid/io" | grep -Eo "[0-9]+")
		let read_first=$(awk '{print $2}' <<< $str)	
		echo $pid $(($read_finally - $read_first))
	fi
done | sort -k2 -n | tail -1)

pid=$(awk '{print $1}' <<< $result)
memory_res=$(awk '{print $2}' <<< $result)
cmdline=$(cat /proc/$pid/cmdline | tr -d '\0')

echo "$pid : $cmdline : $memory_res"
