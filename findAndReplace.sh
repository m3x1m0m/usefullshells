#!/bin/bash
############################################################################################
#
# File name:        findAndReplace.sh
# Author:           Hannes Bohnengel
# Last modified:    04/04/2018
# Required pkgs:    sed
# CLI usage:        findAndReplace.sh filename stringToBeReplaced newString
# Description:      This shell script eases the use of sed 
#                   to find and replace strings in text files.
#                   http://clubmate.fi/replace-strings-in-files-with-the-sed-bash-command/
#                   
############################################################################################

#############
# Variables
#############

ARGC=3
INPUT=$1
OUTPUT=${INPUT%.*}
OUTPUT="${OUTPUT}-replaced.txt"
NAME=$2
NEW_NAME=$3

#############
# Processing
#############

# Check if the expected number of parameters is given.
# If not exit with error.
if [ $# != $ARGC ]
    then
    echo "Error: Please provide the correct arguments!"
    echo "Correct usage is:"
    echo "./findAndReplace.sh [inputFile] [nameToBeReplaced] [pseudonym]"
    exit 1;
fi

# Printing the status
echo -e "=======================================================================\n"
echo "Input file:  ${INPUT}"
echo "Output file: ${OUTPUT}"
echo ""

# Do the replacement (note the double quotes)
echo "Replacing \"${NAME}\" with \"${NEW_NAME}\""
sed "s/${NAME}/${NEW_NAME}/g" $INPUT > $OUTPUT

# Check if sed was executed successfully

if [ $? != 0 ]
    then
        echo "Failed!"
        echo -e "\n======================================================================="
        exit 1
    else
        # Exit with success'
        echo "Success!"
        echo -e "\n======================================================================="
        exit 0
fi


# END OF FILE

