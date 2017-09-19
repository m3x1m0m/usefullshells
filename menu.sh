#!/bin/bash

#################################################################
# This script provides a easy menu application to test different
# functionalities inside a common scope
#
# File name:     menu.sh
# Author:        Hannes Bohnengel
# Last modified: 19 Sep 2017
# Revision:      0.1
#
#################################################################

# Start menu (to save space there is no indentation for the
# content of the while loop)
while :
do
# Clear screen
clear
echo "================================================="
echo "|         >>> Test menu application  <<<        |"
echo "================================================="
echo "| Option 1 :  . . . . . . . . . . . . . . . [1] |"
echo "| Option 2 :  . . . . . . . . . . . . . . . [2] |"
echo "| Exit application :  . . . . . . . . . . . [x] |"
echo "================================================="

# Read user input
echo -n "Input: "
read -e test
echo ""

# Option 1
if [ "$test" == "1" ]; then
	echo -e "Print a line \twith escape characters\n"

# Option 2
elif [ "$test" == "2" ]; then
	echo "2"

# Exit menu
elif [[ "$test" == "x" || "$test" == "X" ]]; then
 	# Exit while loop and end menu
 	break
else
 	echo "Wrong input!"
fi

# Wait for user to press ENTER to show previous output
echo ""
read -s -p "Press ENTER to continue"

# Alternative with any key:
#read -n 1 -s -r -p "Press any key to continue"

# End of while loop
done

# Clear screen
clear
