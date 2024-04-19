#!/bin/bash

operation='+'
let res=1

(tail -f pipe) |
	while true;
       	do
 		read LINE
		case $LINE in
			QUIT)
				echo 'Planned stop'
				exit
				;;
			'+')
				operation='+'
				;;
			'*')
				operation='*'
				;;
			[0-9]*)
				if [[ $operation == '+' ]];
				then
					let res=$res+$LINE
				else
					let res=$res*$LINE
				fi
				echo $res
				;;
			*)
				killall generator.sh
				echo 'Bad input'
				exit
				;;

		esac
	done
