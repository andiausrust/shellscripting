#!/bin/bash

# i/o redirection

FILE="/tmp/data"
head -n1 /etc/password > ${FILE}

read LINE < ${FILE}