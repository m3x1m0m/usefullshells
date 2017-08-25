#!/bin/sh

#################################################################
# Wrapper for cmd line programs in the context of window 	#
# managers like i3wm (e.g. bash scripts).      			#
#                                                               #
# Author:           Maximilian Stiefel                          #
# Last modified:    25. August 2017                             #
# CLI usage:        Put in autostart script (e.g. ~/.i3/config) #
#		    ./i3wm_cmd_wrapper.sh window_name 		#
#		    path_to_script				#
# Required PKGs:    gnome-terminal				#
#                                                               #
#################################################################

#################################################################
# Vars								#
#################################################################
# Exctracting username@server.com
SCRIPT="$2"		
# Extracting window name
WDW_NAME="$1"

# Command 1
MYCMD1="gnome-terminal --hide-menubar --name $WDW_NAME --window-with-profile=max_term_preferences -e "	
# Command 2
MYCMD2="$SCRIPT"
# Command 3
MYCMD3=$MYCMD1$MYCMD2
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
echo "$MYCMD3"
$MYCMD3
