#!/bin/bash
# guessing_game
# A quick bash practice,
# Generate a random number. The player guesses, then we tell them if it's too low. too high, or correct.
# Upon receiving the correct input, exit.

generate_number () {
  export answer=$(((RANDOM%100)+1))
}

# random number
generate_number
guess=""

while true; do
  read -p "Your guess is (integer, 1-100): " guess

  # Check if $guess is a number 
  [[ "$((guess))" != "$guess" ]] && echo "Numbers please!" && continue

  if [[ "$guess" == "$answer" ]]; then
    read -p "Correct! Play again (y/n)? " yn
    case $yn in
      y*)generate_number; continue;;
      *)exit;;
    esac
  fi
  if [[ "$guess" != "$answer" ]]; then
    (( guess > answer )) && echo "Incorrect, too big!"
    (( guess < answer )) && echo "Incorrect, too small!"
  fi
done
