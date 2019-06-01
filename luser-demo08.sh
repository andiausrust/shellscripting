#!/bin/bash

# io redirection

# redirect STDOUT to a file
FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}

# redirect STDIN to a program
read LINE < ${FILE}

echo "line contains: ${LINE}"

# redirect STDOUT and STERR to a file
head -n3 /etc/passwd /fakefile $> {FILE}

# discarding STDOUT
head -n3 /etc/passwd /fakefile > /dev/null