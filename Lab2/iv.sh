#!/bin/bash

for pid in $(ps -axo pid)
do
	ppid=$(grep -Esh "PPid" "/proc/$pid/status" | grep -Eo "[0-9]+")
	sum_exec_rn=$(grep -Esh "sum_exec_runtime" "/proc/$pid/sched" | grep -Eo "[0-9]+\." | sed "s/\.//")
	switches=$(grep -Esh "nr_switches" "/proc/$pid/sched" | grep -Eo "[0-9\.]+")
	
	if [[ -n $switches ]]
	then
		x=$(bc -l <<<"scale=5;$sum_exec_rn/$switches")
		printf "ProcessID=%d : Parent_ProcessID=%d : Average_Running_Time=%f\n" $pid $ppid $x
	fi
done | sort -n -k3 -t "="
