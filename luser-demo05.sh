#!/bin/bash

# random passwords
PASSWORD="${RANDOM}"
echo $RANDOM

PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

PASSWORD="$(date +%s)"
echo "${PASSWORD}"

PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

PASSWORD=$(date %s%N | sha256sum | head -c8)
echo "${PASSWORD}"

PASSWORD=$(date + %s{RANDOM} | sha256sum | head -c16)
echo "${PASSWORD}"

SPECIAL_CHAR=$(echo '!@#$%^&*()_-+=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHAR}"