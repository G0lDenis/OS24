#!/bin/bash

for n in $(seq 20);
do
	total=0
	for i in $(seq 10);
	do
		begin=`date +%s%3N`
		./2_par_runner.sh $n
		end=`date +%s%3N`
		runtime=$((end-begin))
		total=$((total+runtime))
	done
	echo $n	$total
done
