#!/bin/bash

# generates a randowm password 
echo "you executed this command : ${0} with exit code ${?}"

# display what the usr typed on the commandline


#display path and filename
echo "you used $(dirname ${0}) as the path to the $(basename ${0}) script"


# tell the user how many arguments they passed in
echo "you tpyed ${#} arguments"

if [[ "${#}" -lt 1 ]] 
then
    echo "usage. ${0} USERNAME [USERNAME] ..."
    exit 1
fi

for USERNAME in "${@}"
do
    PASSWORD=-$(date +%s | sha256sum | head -c 48)
    echo "${PASSWORD}"
done