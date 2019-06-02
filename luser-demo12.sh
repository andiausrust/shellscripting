#! /bin/bash

# this script generates a random password
# the user can set the password length with -l and add a special character with -s
# verbose mode can be enabled with -v

usage(){
    echo "Usage ${0} [-vs] [-l LENGTH]" >&2
    echo 'Generate a random password.'
    echo '  -l LENGTH   Specifiy a password length.'
    echo '  -s          Append a special character to the password.'
    echo '  -v          Increase verbosity.'
    exit 1
}

log() {
    MESSAGE="${@}"
    if [[ "${VERBOSE}" = 'true' ]]
    then
        echo "${MESSAGE}"
    fi
}

# set a default password length
LENGTH=48

# here are -v -l and -s allowed, if an option is mandatory it has to be followed by a colon -> 
# -l has to be followed by an option of its own
while getopts vl:s OPTION
do
    case ${OPTION} in
        v)
            VERBOSE='true'
            log 'Verbose mode on.'
            ;;
        l)
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

log 'Generating a password.'

PASSWORD=$(date + %s{RANDOM}{RANDOM} | sha256sum | head -c${LENGTH})

# append a special character if requested to do so.
if [[ "$USE_SPECIAL_CHARACTER" = 'true' ]]
then
    log 'Selecting a random special character.'
    SPECIAL_CHARACTER= $(echo '!@#$%^&*()-+=' | fold -w1 | shuf | head -c1)
    PASSWORD="${PASSWORD}${SPECIAL}"
fi

log 'Done.'
log 'Here is your password.'

echo "${PASSWORD}"
exit 0
