#!/bin/sh

#################################################################
# Script to send the IP address of a host to you using a 	#
# Telegram bot. This script also adds a cron job, so that the	#
# bot nofifies you with every boot.				#
#                                                               #
# Author:           Maximilian Stiefel                          #
# Last modified:    26. April 2018                              #
# CLI usage:        						#
# Required PKGs:    mail 					#
#                                                               #
#################################################################

#################################################################
# Vars								#
#################################################################
HOST=$(hostname)
FILE=`realpath $0`
NU_PARAMS=2

#################################################################
# Action							#
#################################################################
# Check if the expected number of parameters is given.  
if [ $# != $NU_PARAMS ]
then
	echo "Error: Illegal number of parameters."	
	exit 1; 
fi
# Get bot token and chat id.
BOT=$1
CHAT_ID=$2
URL="https://api.telegram.org/bot$BOT/sendMessage"
ENTRY="@reboot  $FILE $BOT $CHAT_ID"
# Wait until we are online.
while ! wget -q --spider http://google.com ; do true; done
# Get private IP.
CURRENT_IP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
SUBJECT="IP of $HOST: $CURRENT_IP"
MESSAGE="Hej! Ha en trevlig dag. IP adressen du ville veta är $CURRENT_IP."
# Instruct bot.
curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MESSAGE" > /dev/null
echo "Message sent."
# Grep returns zero if entry is found.
if ! crontab -l | grep -q "$ENTRY" ; then
	crontab -l > cron
	echo "$ENTRY" >> cron
	crontab cron
	rm cron
	echo "Added $ENTRY" 
	echo "to crontab."
else
	echo "Crontab entry $ENTRY"
	echo "already exists."
fi
exit 0;
