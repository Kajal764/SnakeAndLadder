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
	while [[  $positionOfPlayer1 -lt $WINNING_POSITION ]]
	do
			position=$(getPosition $positionOfPlayer1 )
			positionOfPlayer1=$position
			echo  "positionOfPlayer1 $positionOfPlayer1"
	done

		echo "WINNER !!!"
}
getWinningPlayer
