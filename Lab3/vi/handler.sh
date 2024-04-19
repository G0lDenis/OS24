#!/bin/bash

operation='+'

usr1() {
	operation='+'
}

usr2() {
	operation='*'
}

sigterm() {
	echo 'Stopped by generator'
	exit
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'sigterm' SIGTERM

let res=1
while true;
do
	case $operation in
		'+')
			let res=$res+2
			;;
		'*')
			let res=$res*2
			;;
	esac
	echo $res
	sleep 1
done

