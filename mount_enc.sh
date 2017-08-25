#!/bin/sh

#################################################################
# Mounting an extrenal device and mount an encrypted container 	#
# in it. 							#
#                                                               #
# Author:           Maximilian Stiefel                          #
# Last modified:    25. August 2017                             #
# CLI usage:        ./mount_enc.sh				#
# Required PKGs:    encfs, sudo					#
#                                                               #
#################################################################

#################################################################
# Vars								#
#################################################################
# Mountpoint for external drive 
MOUNT_POINT="/media/blabla/xxx"						
# Device identifier
DEVICE="/dev/sdax"
# File system (-t option of mount)
FILE_SYSTEM="ext4"
# Encfs enrypted files location
ENC_LOC="$MOUNT_POINT/.xxx"
# Encfs mount point
ENC_MP="$MOUNT_POINT/xxx"
# Link to mount point
LINK="/home/maximilian/linki"

# Command to execute for mounting
MYCMD1="sudo mount -t $FILE_SYSTEM $DEVICE $MOUNT_POINT"	
# Command to create a mount point if necessary 
MYCMD2="mdkir $MOUNT_POINT"
# Command to check wether the device is already mounted
MYCMD3=$(mount | grep $DEVICE)
# Command to use encfs
MYCMD4="encfs $ENC_LOC $ENC_MP"
# Command to create link
MYCMD5="ln -s $MOUNT_POINT $LINK"
# Command to fire rhythmbox (do not fire rhythmbox before music lib is encrypted)
MYCMD6="bash ~/launch_in_bg.sh rhythmbox"

#################################################################
# Action							#
#################################################################
# Check if mount point does exist if not create
if [ ! -d "$MOUNT_POINT" ]; then
	echo "####################################################"
	echo "Creating directory $MOUNT_POINT" 
	echo "####################################################"
	echo "$MYCMD2"  
	$MYCMD2
	echo 
fi

# Check if mounted already. Is string value set?
if [ ! -n "$MYCMD3" ]
then
	echo "####################################################"
	echo "Mounting external device $DEVICE" 
	echo "to $MOUNT_POINT."
	echo "####################################################"
	echo "$MYCMD1"
	$MYCMD1
	echo 
else
	echo "####################################################"
	echo "$DEVICE is already mounted." 
	echo "####################################################"
	echo 
fi

# Use encfs to create/mount encrypted files
echo "####################################################"
echo "Starting encfs." 
echo "####################################################"
echo "$MYCMD4"
$MYCMD4
echo

# Check if link already exists
if [ ! -e $LINK ]
then
	echo "####################################################"
	echo "Creating symlink $LINK." 
	echo "####################################################"
	echo "$MYCMD5"
	$MYCMD5
	echo	
fi

echo "$MYCMD6"
eval $MYCMD6
read -r -p "Waiting for termination. Press any key ... " key 
exit 0;
