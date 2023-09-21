#!/bin/bash

# for loop

services=("loadbalancer" "virtualmachine" "storage" "vnet" "container")

for i in "${services[@]}"
do
	echo $i
done
