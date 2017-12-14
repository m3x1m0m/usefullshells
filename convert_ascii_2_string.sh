#!/bin/sh

#################################################################
# Script to convert ASCII art to a C string.                    #
#                                                               #
# Author:           Maximilian Stiefel                          #
# Last modified:    13. December 2017                           #
# CLI usage:        ./convert_ascii_2_string.sh file string     #
# Required PKGs:                                                #
#                                                               #
#################################################################

#################################################################
# Vars                                                          #
#################################################################
OUTPUT="$1_converted"
NU_PARAMS=2
STR=$2
CHARS=0
LINES=0

#################################################################
# Action                                                        #
#################################################################

# Check if the expected number of parameters is given.  
if [ $# != $NU_PARAMS ]
  then
  echo "Error: Illegal number of parameters."
  echo "Correct usage is:"
  echo "./convert_ascii_2_string.sh filename stingname"  
  exit 1; 
fi

# Check if file already exists. 
if [ ! -f "$OUTPUT" ] ; then
  # if not create the file
  touch "$OUTPUT"
else
  while true; do
    read -p "File already exists. Overrite? (y/n) " yn
    case $yn in
      [Yy]* ) break;;
      [Nn]* ) exit 1;;
          * ) echo "Please answer yes (y) or no (n).";;
    esac
  done 
fi

# Loop through every line to get size of array to produce
while IFS='' read -r LINE || [[ -n "$LINE" ]]; do
  LENGTH=${#LINE}
  # Add one \n every line
  CHARS=$((CHARS+LENGTH+1))
  LINES=$((LINES+1))
done < "$1"

# Create C stuff.
echo -n "const char $STR[$CHARS] = {" > "$OUTPUT"

echo "About the input file"
echo "--------------------"
echo "Lines: $LINES"
echo "About the output string"
echo "--------------------"
echo "Chars: $CHARS"

# Loop through every line
j=0
while IFS='' read -r LINE || [[ -n "$LINE" ]]; do
  LENGTH=${#LINE}
  for i in $(seq "$((LENGTH-1))")
  do 
    echo -n "'${LINE:$i:1}', " >> "$OUTPUT"
  done
  j=$((j+1))
  if [ $j -eq $LINES ]
  then
    # Finish with \0
    echo "'\n', '\0'};" >> "$OUTPUT"
  else
    echo "'\n', " >> "$OUTPUT"
  fi
done < "$1"
