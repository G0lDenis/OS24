#!/bin/bash

./mem.sh &

let mem_pid=$!

echo > cron.txt

for i in {1..20}; do 
	sleep 3
	res="$(top -b -n1 | head -n 12 )"
	echo "$res"
	s_time=$(echo "$res" | head -n 1 | awk '{print $3}')
	used_mem=$(echo "$res" | grep "MiB Mem" | awk '{print $8}')
	used_swap=$(echo "$res" | grep "MiB Swap" | awk '{print $7}')
	if [[ -z $(echo "$res" | grep "mem.sh") ]]
	then
		mem_virt=NONE
		mem_res=NONE
		mem_cpu=NONE
		mem_ram=NONE
	else
		mem_virt=$(echo "$res" | grep "mem.sh" | awk '{print $5}')
		mem_res=$(echo "$res" | grep "mem.sh" | awk '{print $6}')
		mem_cpu=$(echo "$res" | grep "mem.sh" | awk '{print $9}')
		mem_ram=$(echo "$res" | grep "mem.sh" | awk '{print $10}')
	fi
	echo "$s_time $used_mem $used_swap $mem_virt $mem_res $mem_cpu $mem_ram" >> cron.txt
done
