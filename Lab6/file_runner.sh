#!/bin/bash

while IFS= read -r line && [[ "$line" == "1" ]];
do
    let res=2*$line
    echo $res >> "$1"
done < "$1"
