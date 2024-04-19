#!/bin/bash

mkfifo pipe

./handler.sh &

handler_pid=$!

while true;
do
	read line
	if [[ $line == "QUIT" ]];
	then
		echo "QUIT" > pipe
		exit
	fi
	echo "$line" > pipe
done
