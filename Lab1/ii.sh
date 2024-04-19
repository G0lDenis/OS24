#!/bin/bash

str=""
res=""

read str

while [[ "$str" != "q" ]]
do
	res="$res $str"
	read str
done

echo $res
