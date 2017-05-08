#!/bin/sh

#################################################################
# This is a script to download music files from youtube         #
#                                                               #
# Author:           Hannes Bohnengel                            #
# Last modified:    24 July 2016                                #
# CLI usage:        ./youtube-dl.sh [URL]                       #
# Required PKGs:    youtube-dl, libav-tools                     #
#                                                               #
#################################################################

##
# -- Settings 
##

# First input argument (URL of youtube)
URL="$1"

# Create name of output file (for details see youtube-dl --help)
FILENAME="%(title)s.%(ext)s"

# Extract title of music-file (only to show in CLI)
TITLE=$(youtube-dl --get-title $URL)

# Setup audio format
AUDIO="mp3"

# Define command
MYCMD1="youtube-dl -x --audio-format $AUDIO -o ${FILENAME} ${URL}"

##
# -- End of settings 
##

# Output
echo "================================================================================
 Downloading and transcoding music file from youtube
 ---------------------------------------------------\n
 URL:   $URL
 Title: $TITLE
================================================================================\n"

# Execute command NR 1
echo "$MYCMD1"

$MYCMD1

echo "\n================================================================================
 Finished download
================================================================================"


