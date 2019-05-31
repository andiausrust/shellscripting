#!/bin/bash

# shift and while loops

# display the first three parameter
echo "parameter1: ${1}"
echo "parameter1: ${2}"
echo "parameter1: ${3}"
echo 

while [[ "${#}" -gt 0 ]]
do
    echo "number of parameter is ${#}"
    echo "parameter1: ${1}"
    echo "parameter2: ${2}"
    echo "parameter3: ${3}"
    echo
    shift
done