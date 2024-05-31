#!/bin/bash

N=$1

for i in $(seq $N);
do
        cp "example.txt" "$$_$i.txt"
done

for i in $(seq $N);
do
        ./file_runner.sh "$$_$i.txt"
done 

for i in $(seq $N);
do
        rm "$$_$i.txt"
done

