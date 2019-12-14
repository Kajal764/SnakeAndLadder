#!/bin/bash -x 

echo "!!!!! Welcome To Snake And Ladder Game !!!!!"

#constant
START=0
NOPLAY=0
SNAKE=1
LADDER=2
WINNING_POSITION=100

#variable
position=0


function movePosition(){
	while [[  $position -ne $WINNING_POSITION ]]
	do
		die=$(($((RANDOM%6))+1))
		echo "die value $die"
		move=$(($RANDOM%3))

		case $move in
		$NOPLAY)
			echo "No Move"
		;;
		$SNAKE)
			echo "Snake Move"
			if [ $(( $position - $die )) -ge $START ]
			then
				  position=$(( $position - $die ))
			fi
		;;
		$LADDER)
			echo "Ladder Move"
			if [[ $(($position + $die)) -le $WINNING_POSITION ]]
			then
				position=$(($position + $die))
			fi
		;;
		esac
	 	echo "position $position"
	done

}
movePosition
