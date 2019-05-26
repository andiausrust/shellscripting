#!/bin/bash

# display the uid and username of the user executing this script
# display if the user is root or not

# dipslay uid
echo "uid is ${UID}"

# display username
USER_NAME=$(id -un)
echo "your username is ${USER_NAME}"

# user is root?
if [[ "${UID} -eq  0" ]]
then
    echo 'you are root'
else
    echo 'your are not root'
fi