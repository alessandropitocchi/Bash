#!/bin/bash

# If

echo "Scrivi un numero: "
read number

if [ $((number % 2)) -eq 0 ];
then
	echo "The number $number is even!";
else
	echo "The number $number is odd!"
fi
