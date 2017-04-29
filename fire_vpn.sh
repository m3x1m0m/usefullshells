#!/bin/sh

#################################################################
# Script to activate and deactivate a VPN connection.  		#
#                                                               #
# Author:           Maximilian Stiefel                          #
# Last modified:    29. April 2017                              #
# CLI usage:        ./fire_vpn.sh up/down			#
# Required PKGs:    nmcli 					#
#                                                               #
#################################################################

#################################################################
# Vars								#
#################################################################
# UUID of connection 
UUID="5a770ffe-db28-486e-842e-e41abd0c3d10"				
# Expected number of parameters
NU_PARAMS=1;

# Command to set up connection to VPN
MYCMD1="nmcli --ask connection $1 uuid $UUID"	

#################################################################
# Action							#
#################################################################
# Check if the expected number of parameters is given.  
if [ $# != $NU_PARAMS ]
then
	echo "Error: Illegal number of parameters."
	echo "Correct usage is:"
       	echo "./fire_vpn.sh up/down"	
	exit 1; 
fi

# Check what shall be done 
if [ "$1" = "up" ]
then
	echo "####################################################"
	echo "Firing up VPN connection." 
	echo "####################################################"
elif [ "$1" = "down" ]
then
	echo "####################################################"
	echo "Closing down VPN connection." 
	echo "####################################################"
else
	echo "####################################################"
	echo "Retarded input argument." 
	echo "####################################################"
	exit 1;
fi
echo "$MYCMD1"
$MYCMD1
read -n1 -r -p "Waiting for termination. Press any key ... " key
exit 0;
