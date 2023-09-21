#!/bin/bash

#Comment

#Variables
hello_message="Hello world!"
current_dir=$(pwd)

#Constant
readonly variable_wont_change="blue"

#Print
echo $hello_message
echo $current_dir
echo "$hello_message from $current_dir, your favourite color is $variable_wont_change"
