#!/bin/bash

# generates a randowm password 

# display what the usr typed on the commandline
echo "you executed this command: ${0}"

#display path and filename
echo "you used $(dirname ${0}) as path to the $(basename ${0})"

# tell the user how many arguments they passed in
NUMBER_OF_PARAMETERS="${#}"
echo "you supplied arguments ${NUMBER_OF_PARAMETERS}"

if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then
    echo "usage: ${0} username [user_name]..."
    exit 1
fi

for USER_NAME in "${@}"
do
    PASSWORD=$(date +%s)
    echo "${USER_NAME}: ${PASSWORD}"
done