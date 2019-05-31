#!/bin/bash

# this script creates a new user on the local system
# you must supply a username as an argument to the script
# optionall, you can also provide a comment for the account as an argument
# a password will be generated automatically
# the username, password and host for the account will be displaye

# make shure the script is beeing executed with superuser privileges
if [[ "${UID}" -ne 0 ]]
then
    echo ' please run with sudo or as root'
    exit 1
fi

# at least one argument is required
if [[ "${#}" -lt 1 ]]
then
    echo "Usage: ${0} USER_NAME [COMMENT]..."
    ECHO 'Create an account ...'
    exit 1
fi

# the first parameter is the username
USER_NAME="${1}"

# take the username out and the rest of the parameters are for the account comments
shift
COMMENT="{@}"

# generate a password
PASSWORD=$(date +%s | sha256sum | head -c48)

# create the account
useradd -c "${COMMENT}" -m "${USER_NAME}"

# check for the return status to see if successfully created an account
if [[ "${?}" -ne 0 ]]
then
    echo 'the account could not be created'
    exit 1
fi

# set the password
echo ${PASSWORD} | password --stdin ${USER_NAME}

# check if password command succeeded
if [[ "${?}" -ne 0 ]]
then
    echo 'password could not be set'
    exit 1
fi

# Force password change on first login
passwd -e ${USER_NAME}

# display the username, password and the host where the user was created
echo
echo 'username'
echo "${USER_NAME}"
echo
echo 'password'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0