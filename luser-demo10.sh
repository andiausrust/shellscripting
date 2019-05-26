#!/bin/bash

log() {
    # this functions sends a message to syslog and standard out if VERBOSE is true
    local MESSAGE="${@}"
    if [[ "${VERBOSE}" = 'true'  ]]
        then
            echo "${MESSAGE}"
        fi
    logger -t luser-demo10.sh "${MESSAGE}"
}

backup_file() {
    # this function creates a backup of a file. Returns non-zero status on error.
    local FILE="${1}"

    # make sure the file exists
    if [[ -f "${FILE}" ]]
        then
            local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date + %F-%N)"
            log "Backing up ${FILE} to ${BACKUP_FILE}."

            # the exit status of the function will be the exit statusof the cp command
            # p ... preserve the files mode, ownership and timestamps
            cp -p ${FILE} ${BACKUP_FILE}
        else
            # the file does not exits, so return a non-zero exit status
            return 1
    fi
}

readonly VERBOSE='true'
log 'hello'
log 'this is fun'

backup_file '/etc/password'

# make a decision based on the exit status of the function
if [[ "${?}" -eq '0' ]]
then
    log 'file backup succeeded'
else
    log 'file backup failed'
    exit 1
fi