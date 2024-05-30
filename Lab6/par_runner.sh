#!/bin/bash

N=$1

last_pid=0

for i in $(seq $N);
do
	./100_digits_pi.sh 100 & pids[${i}]=$!
done

for pid in ${pids[*]};
do
	wait $pid
done
