#!/bin/bash

if [[ "$HOME" = "$PWD" ]]
then
	exit 0
else
	echo "Not home directory"
	exit 1
fi

