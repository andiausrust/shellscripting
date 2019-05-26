#!/bin/bash

# hello from main os

echo 'hello'
WORD='script'

echo "$WORD"

# single ticks cause variable to not get expanded
echo '$WORD'

# didplay the contents of the variable with diffrent syntax
echo "this is a shell script ${WORD}"

#append text to the variable
echo "${WORD}ing is fun!"

ENDING='ed'

echo "this ${WORD}${ENDING}"

