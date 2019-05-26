#!/bin/bash

# creates an account on local
# you will be prompted for the account name and passwor

#ask for username
read -p 'enter your username: ' USER_NAME

#ask for realname
read -p 'enter the name of the user this account is for: ' COMMENT

#password
read -p 'enter the password: ' PASSWORD

#create user
useradd -c "${COMMENT}" -m ${USER_NAME}

#set password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

#force user to change pw first time he logs in
passwd -e ${USER_NAME}