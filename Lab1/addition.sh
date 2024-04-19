#!/bin/bash

./iv.sh

if [[ $? -eq 1 ]]
then
	echo "Got 1, some eror!"
else
	echo "Got 0, nice!"
fi
