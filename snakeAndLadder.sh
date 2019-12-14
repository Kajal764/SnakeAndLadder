#!/bin/bash -x 

echo "!!!!! Welcome To Snake And Ladder Game !!!!!"

#constant
START=0
NOPLAY=0
SNAKE=1
LADDER=2
WINNING_POSITION=100

#variable
positionOfPlayer1=0
positionOfPlayer2=0
player=1
position=0

function getPosition(){
	position=$1
	die=$(($((RANDOM%6))+1))
	move=$(($RANDOM%3))
	case $move in
	$NOPLAY)
	;;
	$SNAKE)
		if [ $(( $position - $die )) -ge $START ]
		then
			  position=$(( $position - $die ))
		fi
	;;
	$LADDER)
		if [[ $(($position + $die)) -le $WINNING_POSITION ]]
		then
			position=$(($position + $die))
		fi
	;;
	esac

	echo $position
}


function getWinningPlayer(){
	while [[  $positionOfPlayer1 -lt $WINNING_POSITION && $positionOfPlayer2 -lt $WINNING_POSITION ]]
	do
		if [[ $player -eq 1 ]]
		then
			echo "player 1"
			position=$(getPosition $positionOfPlayer1 )
			positionOfPlayer1=$position
			echo  "positionOfPlayer1 $positionOfPlayer1"
			player=2
		else
			echo "player 2"
			position=$(getPosition $positionOfPlayer2)
			positionOfPlayer2=$position
         echo  "positionOfPlayer2 $positionOfPlayer2"
			player=1
		fi
	done

	if [[ $positionOfPlayer1 -eq $WINNING_POSITION ]]
	then
		echo "WINNER IS PLAYER 1 !!!"
	else
		echo "WINNER IS PLAYER 2 !!!"
	fi
}
getWinningPlayer
