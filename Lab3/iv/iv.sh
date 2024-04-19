#!/bin/bash

./aux.sh &

let pid_first=$!

echo $pid_first
./aux.sh &
./aux.sh &

let pid_third=$!

let a=1
while true;
do
	cpu_usage=$(ps -p $pid_first -o %cpu | tail -1)
	if [[ ( $a -gt 0 ) && ( $( echo "$cpu_usage > 10.0" | bc -l ) ) ]];
	then
		kill -SIGSTOP $pid_first
		let a=0
	fi
	if [[ ( $a -lt 1 ) && ( $( echo "$cpu_usage < 10.0" | bc -l ) ) ]];
        then
		kill -SIGCONT $pid_first
                let a=1
        fi
done &

kill $pid_third
