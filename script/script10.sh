#!/bin/bash

# break

while true; do
	read -p "Enter a number betwwen 1 and 25: " n
	if [[ $n -ge 1 && $n -le 25 ]];
	then
		echo "You entered $n"
	else
		echo "You didn't eneter a number in range, goodbye!"
		break
	fi
done

echo "Break happened!"
