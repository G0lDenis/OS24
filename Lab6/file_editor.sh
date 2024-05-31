#!/bin/bash

echo 1 > "1.txt"

for i in $(seq 100000);
do
	echo 1 >> "1.txt"
done
