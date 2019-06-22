#!/bin/sh

#################################################################
# Script to send the IP address of a host to you using a   
# Telegram bot. This script also adds a cron job, so that the  
# bot nofifies you with every boot.        
#                                                               
# Author:           Maximilian Stiefel                          
# Last modified:    26. April 2018                              
# CLI usage:        ./send_telegram_dynamic_ip bot chat    
# Required PKGs:    
#                                                               
#################################################################

#################################################################
# Vars                
#################################################################
BACKUP_FILES="/home/jasmina"
DEST="/run/user/1000/gvfs/smb-share:server=fritz-nas,share=fritz.nas/Backups"

DAY=$(date +%Y-%m-%d)
HOSTNAME=$(hostname -s)
ARCHIVE_FILE="$HOSTNAME-$DAY.tar.gz"

#################################################################
# Action               
#################################################################
echo "Backing up $BACKUP_FILES to $DEST/$ARCHIVE_FILE"
date
echo
tar cvzf $DEST/$ARCHIVE_FILE $BACKUP_FILES
echo
echo "Backup done."
date
ls -ahl $DEST
