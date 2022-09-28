#!/bin/bash
#Gal Giladi 312491616
init_board() {
  clear
  var1=50
  var2=50
  echo " Player 1: ${var1}         Player 2: ${var2} " 
  echo " --------------------------------- "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " |       |       O       |       | "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " --------------------------------- "
}

check_validity1() {
  #function returns flag=1 if there is an invalid move, and flag=0 if move is valid
  flag=0
  #use a regular expression to check if input is a number
  if ! [[ "$player_1_guess" =~ ^[0-9]+$ ]]; then
        echo "NOT A VALID MOVE !"
	flag=1
  elif [ "$player_1_guess" -lt 0 ]; then
        echo "NOT A VALID MOVE !"
	flag=1
  elif [ "$player_1_guess" -gt "$var1" ]; then
        echo "NOT A VALID MOVE !"
	flag=1
  fi
}

check_validity2() {
  #function returns flag=1 if there is an invalid move, and flag=0 if move is valid
  flag=0
  #use a regular expression to check if input is a number
  if ! [[ "$player_2_guess" =~ ^[0-9]+$ ]]; then
        echo "NOT A VALID MOVE !"
	flag=1
  elif [ "$player_2_guess" -lt 0 ]; then
        echo "NOT A VALID MOVE !"
	flag=1
  elif [ "$player_2_guess" -gt "$var2" ]; then
        echo "NOT A VALID MOVE !"
	flag=1
  fi
}

turn_player_1() {
        echo "PLAYER 1 PICK A NUMBER: "
        read -s player_1_guess
        check_validity1
        if [ "$flag" -eq 1 ]; then
                turn_player_1
        fi

}

turn_player_2() {
        echo "PLAYER 2 PICK A NUMBER: "
        read -s player_2_guess
        check_validity2
        if [ "$flag" -eq 1 ]; then
                turn_player_2
        fi
}

print_board0() {
#  clear
  var1=$[ $var1-$player_1_guess ]
  var2=$[ $var2-$player_2_guess ]
  echo " Player 1: ${var1}         Player 2: ${var2} " 
  echo " --------------------------------- "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " |       |       O       |       | "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " --------------------------------- " 
  echo -e "       Player 1 played: ${player_1_guess}\n       Player 2 played: ${player_2_guess}\n\n"
}

print_board-3() {
#  clear
  var1=$[ $var1-$player_1_guess ]
  var2=$[ $var2-$player_2_guess ]
  echo " Player 1: ${var1}         Player 2: ${var2} " 
  echo " --------------------------------- "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo "O|       |       #       |       | "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " --------------------------------- " 
  echo -e "       Player 1 played: ${player_1_guess}\n       Player 2 played: ${player_2_guess}\n\n"
}

print_board-2() {
#  clear
  var1=$[ $var1-$player_1_guess ]
  var2=$[ $var2-$player_2_guess ]
  echo " Player 1: ${var1}         Player 2: ${var2} " 
  echo " --------------------------------- "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " |   O   |       #       |       | "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " --------------------------------- " 
  echo -e "       Player 1 played: ${player_1_guess}\n       Player 2 played: ${player_2_guess}\n\n"
}

print_board-1() {
#  clear
  var1=$[ $var1-$player_1_guess ]
  var2=$[ $var2-$player_2_guess ]
  echo " Player 1: ${var1}         Player 2: ${var2} " 
  echo " --------------------------------- "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " |       |   O   #       |       | "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " --------------------------------- " 
  echo -e "       Player 1 played: ${player_1_guess}\n       Player 2 played: ${player_2_guess}\n\n"
}

print_board1() {
#  clear
  var1=$[ $var1-$player_1_guess ]
  var2=$[ $var2-$player_2_guess ]
  echo " Player 1: ${var1}         Player 2: ${var2} " 
  echo " --------------------------------- "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " |       |       #   O   |       | "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " --------------------------------- " 
  echo -e "       Player 1 played: ${player_1_guess}\n       Player 2 played: ${player_2_guess}\n\n"
}

print_board2() {
#  clear
  var1=$[ $var1-$player_1_guess ]
  var2=$[ $var2-$player_2_guess ]
  echo " Player 1: ${var1}         Player 2: ${var2} " 
  echo " --------------------------------- "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " |       |       #       |   O   | "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " --------------------------------- " 
  echo -e "       Player 1 played: ${player_1_guess}\n       Player 2 played: ${player_2_guess}\n\n"
}

print_board3() {
#  clear
  var1=$[ $var1-$player_1_guess ]
  var2=$[ $var2-$player_2_guess ]
  echo " Player 1: ${var1}         Player 2: ${var2} "
  echo " --------------------------------- "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " |       |       #       |       |O"
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " --------------------------------- "
  echo -e "       Player 1 played: ${player_1_guess}\n       Player 2 played: ${player_2_guess}\n\n"
}

#initialize the board
init_board
#get as an input the 2 guesses of players and check if its legit
turn_player_1
turn_player_2
case=0
while [ "$case" -ne -3 ] || [ "$case" -ne 3 ] || [ "$var1" -le 0 ] || ["$var2" -le 0 ]
do
 if [ "$player_1_guess" -lt "$player_2_guess" ]; then
	if [ "$case" -ge 0 ]; then
		case=-1
	elif [ "$case" -eq -1 ]; then
		case=-2
	elif [ "$case" -eq -2 ]; then
		case=-3
	fi
 fi

 if [ "$player_2_guess" -lt "$player_1_guess" ]; then
        if [ "$case" -le 0 ]; then
                case=1
        elif [ "$case" -eq 1 ]; then
                case=2
        elif [ "$case" -eq 2 ]; then
                case=3
	fi
 fi

 if [ "$player_2_guess" -eq "$player_1_guess" ]; then
	case="$case"
 fi

 case "$case" in
 -3)
  print_board-3
  echo "PLAYER 2 WINS !"
  exit ;;
 -2)
  print_board-2
  if [ "$var1" -eq 0 ] && [ "$var2" -eq 0 ]; then
  echo "PLAYER 2 WINS !"
  elif [ "$var1" -eq 0 ]; then
  echo "PLAYER 2 WINS !"
  elif [ "$var2" -eq 0 ]; then
  echo "PLAYER 1 WINS !"
  exit
  fi
  ;;
 -1)
  print_board-1
  if [ "$var1" -eq 0 ] && [ "$var2" -eq 0 ]; then
  echo "PLAYER 2 WINS !"
  elif [ "$var1" -eq 0 ]; then
  echo "PLAYER 2 WINS !"
  elif [ "$var2" -eq 0 ]; then
  echo "PLAYER 1 WINS !"
  exit
  fi
  ;;
  0)
  print_board0
  if [ "$var1" -eq 0 ] && [ "$var2" -eq 0 ]; then
  echo "IT'S A DRAW !"
  exit
  fi
  ;;
  1)
  print_board1
  if [ "$var1" -eq 0 ] && [ "$var2" -eq 0 ]; then
  echo "PLAYER 1 WINS !"
  elif [ "$var1" -eq 0 ]; then
  echo "PLAYER 2 WINS !"
  elif [ "$var2" -eq 0 ]; then
  echo "PLAYER 1 WINS !"
  exit
  fi
  ;;
  2)
  print_board2
  if [ "$var1" -eq 0 ] && [ "$var2" -eq 0 ]; then
  echo "PLAYER 1 WINS !"
  elif [ "$var1" -eq 0 ]; then
  echo "PLAYER 2 WINS !"
  elif [ "$var2" -eq 0 ]; then
  echo "PLAYER 1 WINS !"
  exit
  fi
  ;;
  3)
  print_board3
  echo "PLAYER 1 WINS !"
  exit ;;

 esac

 #exit if points of one of the players is 0
 if [ "$var1" -eq 0 ] || [ "$var2" -eq 0 ]; then
  exit
 fi
 #get again as an input the 2 guesses of players and check their validity
 turn_player_1
 turn_player_2
#end of while loop
done
