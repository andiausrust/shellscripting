#!/bin/bash

# this script demonstrates the case statement

case "${1}" in
start)
    echo 'starting'
    ;;
stop)
    echo 'stopping'
    ;;
status | state)
    echo 'status'
    ;;
*)
    echo 'supply a valid option' >&2
    exit 1
    ;;
esac