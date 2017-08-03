#/bin/bash

# Works only without spaces in the titles

SUFFIX=mp3

for IMG_FILE in *.mp4
do
	#strip .mp4 from file name
	IMG_FILE_NAME=${IMG_FILE%.*}
	echo "avconv -i ${IMG_FILE} ${IMG_FILE_NAME}.${SUFFIX}"
	avconv -i ${IMG_FILE} ${IMG_FILE_NAME}.${SUFFIX}
done
