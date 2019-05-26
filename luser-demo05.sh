#!/bin/bash

# random passwords
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

PASSWORD=$(date +%s%n)
echo "${PASSWORD}"

PASSWORD=$(date +%s | sha256sum | head -c32)
echo "${PASSWORD}"