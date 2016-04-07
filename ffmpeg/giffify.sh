#!/bin/sh
# License for any modification to the original (linked below):
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# Sebastiano Poggi wrote this file.  As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.
# ----------------------------------------------------------------------------
#
# Based upon http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html
# Usage: giffify.sh inputFile outputFile [targetHeight] [targetFps]
# Defaults: defaultHeight = 500px, targetFps = 15

inputFile="$1"
outputFile="$2"
desiredHeight=$3
if [[ -z $desiredHeight ]]; then
	desiredHeight=500
fi
fps=$4
if [[ -z $fps ]]; then
	fps=15
fi
 
palette="palette.png"
filters="fps=$fps,scale=-1:$desiredHeight:flags=lanczos"
 
ffmpeg -v warning -i $inputFile -vf "$filters,palettegen" -y $palette
if [[ -f $palette ]]; then
  ffmpeg -v warning -i $inputFile -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $outputFile
  rm $palette
fi