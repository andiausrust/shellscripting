#!/bin/bash

#random psswd
#set the length with -l and add a special cahracter with -s
#verbose mode can be enabled with -v

usage() {
    echo "Usage: ${0} [-vs] [-l LENGTh]" >$2
    echo 'Generate a random password.'
    echo '  -l LENGTH   Specify the password length.'
    echo '  -s          Append a special character to the password.'
    echo '  -v          Increase verbosity.'
    exit 1
}

log() {
    local MESSAGE="${@}"
    if [[ "${VERBOSE}" = 'true' ]] 
    then
        echo "${MESSAGE}"
    fi
}

#set a default passwd length
LENGTH=40

# what options are valid -> -v, -l and -s are valid
# if option should have a mandatory value follow it by a colon -l must be followed by an
# option of its own 
while getopts vl:s OPTION
do
    case ${OPTION} in
        v)
            VERBOSE='true'
            log 'Verbose mode on'
            ;;
        l)
            # if an option requires an argument getopts places that value into the shell variable
            # OPTARG if -l 4 -> 4 will be assigned to OPTARG
            LENGTH="${OPTARG}"
            ;;
        s)
            USE_SPECIAL_CHARACTER='true'
            ;;
        ?)
            usage
            ;;
    esac
done

log 'Generating a password'

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c${LENGTH})

#append a special character
if [[ "$USE_SPECIAL_CHARACTER" = 'true' ]]
then
    log 'Selecting a random special character.'
    SPECIAL_CHARACER=$(echo '!@#$^&*()-+=' | fold -w1 | shuf | head -c1)
    PASSWORD="${PASSWORD}${SPECIAL_CHARACTER}"
fi

log 'done'
log 'here is your password'
echo "${PASSWORD}"

# remove the options while leaving the remaining arguments.
shift "$(( OPTIND -1 ))"


if [[ "${#}" -gt 0  ]]
then 
    usage
fi


exit 0
 