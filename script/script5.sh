#!/bin/bash

# Functions

check_even () {
	local mod=2
	
	if [ $(($1 % $mod)) -eq 0 ];
	then
		echo "The number $1 is even!";
	else
		echo "The number $1 is odd!"
	fi
}

read -p "Enter a number: " number

check_even $number
