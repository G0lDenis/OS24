#!/bin/bash

if [[ $# != 3 ]]
then
	echo "need 3 arguments"
	exit
fi

res=0
if [[ $1 -ge $2 ]]
then res=$1
else res=$2
fi

if [[ $res -le $3 ]]
then res=$3
fi

echo $res
