#!/bin/bash

str="$(\.\/iv.sh)"
IFS=$'\n'

#Если bash встречает в данных любой из этих символов(' ', '\t', '\n'), он считает, 
#что перед ним — следующее самостоятельное значение списка.

cur_ppid=""
let counter=0
sum=0

for s in $str
do
	ppid_cur=$(awk '{print $3}' <<< $s | grep -Eo "[0-9]+")
	art=$(awk '{print $5}' <<< $s | grep -Eo "[0-9.]+")
	
	if [[ -z "$cur_ppid" ]]
	then
		cur_ppid=$ppid_cur
	fi

	if [[ $ppid_cur -ne $cur_ppid ]]
	then
		x=$(bc -l <<<"scale=5;$sum/$counter")
		printf "Average_Running_Children_of_ParentID=%d is %f\n" $cur_ppid $x
		let counter=1
		sum=$art
		cur_ppid=$ppid_cur
		# echo $s
	else
		((counter++))
		sum=$(bc -l <<<"scale=5;$sum+$art")
		#echo $s
	fi	
done
