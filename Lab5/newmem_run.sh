#!/bin/bash

N=2900000
K=30
for i in $(seq $K);
do
	./newmem.sh $N &
	sleep 1
done
