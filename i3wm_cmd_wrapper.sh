#!/bin/sh

#################################################################
# Wrapper for cmd line programs in the context of window 	#
# managers like i3wm (e.g. bash scripts).      			#
#                                                               #
# Author:           Maximilian Stiefel                          #
# Last modified:    29. April 2017                              #
# CLI usage:        Put in autostart script (e.g. ~/.i3/config) #
#		    ./i3wm_cmd_wrapper.sh window_name 		#
#		    path_to_script				#
# Required PKGs:    xterm					#
#                                                               #
#################################################################

#################################################################
# Vars								#
#################################################################
# Exctracting username@server.com
SCRIPT="$2"		
# Extracting window name
WDW_NAME="$1"

# Command to execute
MYCMD1="xterm -T $WDW_NAME -e \"$SCRIPT\""	
# Expected number of params
NU_PARAMS=2;

#################################################################
# Action							#
#################################################################
# Check if the expected number of parameters is given.  
if [ $# != $NU_PARAMS ]
then
	    	echo "Error: Illegal number of parameters."
		echo "Correct usage is:"
		echo "./i3wm_cmd_wrapper.sh window_name path_to_script"	
		exit 1;
fi
echo "$MYCMD1"
xterm -T $WDW_NAME -e "$SCRIPT"
