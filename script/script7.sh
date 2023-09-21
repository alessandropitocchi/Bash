#!/bin/bash

# Until loop

counter=1

until [[ $counter -gt 10 ]]; do
	echo "The counter is at: $counter"
	counter=$((counter+1))
done
echo "The count has finished!"
