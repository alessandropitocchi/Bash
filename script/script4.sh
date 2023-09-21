#!/bin/bash

# Case

read -p "Enter a value: " n

case $n in
	1|2)
	    echo "One or Two";;
	3|4)
	    echo "Three of Four";;
	5)
            echo "Five";;
	??)
	    echo "Two Characters";;
	*)
	    echo "Other";;
esac
