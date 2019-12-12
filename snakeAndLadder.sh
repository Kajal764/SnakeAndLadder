#!/bin/bash -x 

echo "!!!!! Welcome To Snake And Ladder Game !!!!!"

#constant
START=0
NOPLAY=0
SNAKE=1
LADDER=2

#variable
position=0


function movePosition(){
	die=$(($((RANDOM%6))+1))
	move=$(($RANDOM%3))

	case $move in
	$NOPLAY)
		echo "No Move"
	;;
	$SNAKE)
		echo "Snake Move"
		position=$(( $poistion - $die ))
		if [[ $position -lt 0 ]]
		then
			position=$START
		fi
	;;
	$LADDER)
		echo "Ladder Move"
		position=$(($poistion+$die))
	;;
        esac
	 echo $position

}
movePosition
