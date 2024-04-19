#!/bin/bash

./handler.sh &
handler_pid=$!

while true;
do
	read line
	case $line in
		'TERM')
			kill $handler_pid
			exit
			;;
		'+')
			kill -USR1 $handler_pid
			;;
		'*')
			kill -USR2 $handler_pid
			;;
	esac
done
