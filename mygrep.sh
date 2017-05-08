#!/bin/sh

#####################################################################################################
#
# Filename:        mygrep.sh
# Author:          Hannes Bohnengel
# Last modified:   22 Dec 2016
#
# Comments:
# -------------
# This is a bash script to use grep to search for something
#
#####################################################################################################

# Options
OPT="-rlnw"

# Location where to search
LOC=$1

# Search string
STR=$2

# Define command
MYCMD1="grep $OPT $LOC -e $STR"

# Command to use
CMD=$MYCMD1

# Output:
echo "--------------------------------------------------------------------------------\n
>> Executing the following command:\n
$CMD\n
>> Results of search:\n"

$CMD
