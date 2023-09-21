#!/bin/bash

# While loop

counter=11
while [[  "$counter" -le 10 ]]; do
	echo "The counter is at: $counter"
	counter=$((counter+1))
done
echo "The count has finished."
