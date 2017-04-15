#!/bin/sh

#################################################################
# For establishing a SOCKS connection via SSH.		        #
#                                                               #
# Author:           Maximilian Stiefel                          #
# Last modified:    15. April 2017                              #
# CLI usage:        ./ssh_socks.sh user@server.com remote_port  #
# Required PKGs:    ssh, firefox				#
#                                                               #
#################################################################

#################################################################
# Vars								#
#################################################################
# Exctracting username@server.com
USER_SERVER="$1"						
# Extracting port at server.com for SSH
PORT="$2"
# Command to execute
MYCMD1="ssh -C2TnN -D 8080 -p $PORT $USER_SERVER"	
# Expected number of params
NU_PARAMS=2;

#################################################################
# Action							#
#################################################################
# Check if the expected number of parameters is given.  
if (( $# != $NU_PARAMS )); then
    	echo "Error: Illegal number of parameters."
	echo "Correct usage is:"
	echo "./ssh_socks.sh user@server.com remote_port"
	exit 1;
fi

echo "####################################################"
echo "Connecting to server. Leave shell open ;)"
echo "####################################################"
echo ""
echo "####################################################"
echo "Firefox Configuration:"
echo "----------------------"
echo "Advanced->Network->Connection Settings"
echo "->SOCKS->Host: 127.0.0.1->Port: 8080"
echo "####################################################"

echo "$MYCMD1"

$MYCMD1
