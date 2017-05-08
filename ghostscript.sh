#!/bin/sh

#################################################################
# This is a script to compress pdf files with ghostscript
#
# Author:        Hannes Bohnengel
# Last modified: 21 September 2016
# Revision:      0.1
# CLI usage:     ./ghostscript.sh [FILENAME] [COMPRESSION LEVEL]
# Sources:       https://gist.github.com/firstdoit/6390547
#                http://ghostscript.com/doc/current/Ps2pdf.htm
#
#################################################################

##
# -- Settings 
##

# First input argument (name of input file)
IN="$1"

# Second input argument (compression level)
LEVEL="$2"

# Description of compression levels
#- /screen selects low-resolution output similar to the Acrobat Distiller "Screen Optimized" setting.
#- /ebook selects medium-resolution output similar to the Acrobat Distiller "eBook" setting.
#- /printer selects output similar to the Acrobat Distiller "Print Optimized" setting.
#- /prepress selects output similar to Acrobat Distiller "Prepress Optimized" setting.
#- /default selects output intended to be useful across a wide variety of uses, possibly at the expense of a larger output file. 

# Setting compression level (5: highest compression; 1: lowest compression)
case "$LEVEL" in
1) COMP="/prepress"
   ;;
2) COMP="/printer"
   ;;
3) COMP="/ebook"
   ;;
4) COMP="/screen"
   ;;
5) COMP="/default"
   ;;
*) COMP="/printer"
LEVEL=2
   ;;
esac

# Create name of output file as INPUTNAME_compressed.pdf
OUT=${IN%.*}
OUT="${OUT}-compressed-$LEVEL.pdf"

# Define command
MYCMD="gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=${COMP} -dNOPAUSE -dQUIET -dBATCH -sOutputFile=${OUT} ${IN}"

##
# -- End of settings 
##

# Output
echo "================================================================================
 Compression of a pdf file using ghostscript\n
 Input file name:   $IN
 Output file name:  $OUT
 Compression level: $LEVEL/5
================================================================================\n
> Starting compression...\n"

# Check second input parameter
#if [ $2 -lt 1 ] || [ $2 -gt 5 ]
#then
#  echo "> Unvalid compression level input -> Set compression level to $LEVEL\n
#> Starting compression...\n"
#else
#  echo "> Starting compression...\n"
#fi

# Execute command
$MYCMD

echo "\n> Finished compression"

#################################################################
# EOF
#################################################################
