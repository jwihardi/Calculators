#!/bin/bash
function calculator(){ # doesn't need a function
  echo "***************************"
  echo "A SIMPLE CALCULATOR IN BASH"
  echo "ENTER INPUTS WITHOUT SPACES"
  echo -e "***************************\n\n" # -e to recognize '\n'

  while true;
  do
    read -p "Enter an operation (+, -, *, /) | 'q' to quit: " option # -p to print user for input
    if [ "$option" == "q" ] || [ "$option" == "Q" ]; then 
      break 
    fi
    # Bash only has integer math, I would have to use 'bc' but I don't want to 
    read -p "Enter number 1 (integer): " num1
    read -p "Enter number 2 (integer): " num2
    total=0
 
    case "$option" in
      "+")
        total="$((num1+num2))"
        ;;
      "-")
        total="$((num1-num2))"
        ;;
      "*")
        total="$((num1*num2))"
        ;;
      "/")
        total="$((num1/num2))"
        ;;
    esac
    echo "The result is: $total"
  done
  }

calculator # call calculator function
