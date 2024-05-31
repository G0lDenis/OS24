#!/bin/bash

N=$1

last_pid=0

for i in $(seq $N);
do
        cp "example.txt" "$$_$i.txt"
done

for i in $(seq $N);
do
	./file_runner.sh "$$_$i.txt" & pids[${i}]=$!
done

for pid in ${pids[*]};
do
	wait $pid
done

for i in $(seq $N);
do
        rm "$$_$i.txt"
done
