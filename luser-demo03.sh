#!/bin/bash

#display the uid and username of the existing user executing this script
#display if th is user is the vagrant user

#display the uid
echo "your uid is ${UID}"

#only display a message if the uid does not match 1000
UID_TO_TEST_FOR='501'

if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]]
then
    echo "your id  does not match ${UID_TO_TEST_FOR}"
    exit 1
fi

#display the username
USER_NAME=$(id -un)

#test if the command succeeded
if [[ "${?}" -ne 0 ]]
then 
    echo 'id did not execute successful'
    exit 1
fi
echo "your username is ${USER_NAME}"

#you cna use a string test conditional
USER_NAME_TO_TEST_FOR='vagrant'
if [[ "${USER_NAME}" = "${UUSER_NAME_TO_TEST_FOR}"  ]]
then
    echo "your username equeyl ${USER_NAME_TO_TEST_FOR}"

#test for !=(not equal) for the string
if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}" ]]
then
    echo "your name does not math ${USER_NAME_TO_TEST_FOR}"
    exit 1
fi
exit 0
