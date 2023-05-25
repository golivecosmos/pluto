#!/bin/bash

# Check if the script is called with the correct number of arguments
if [ "$#" -eq 0 ]; then
    echo "Error: No filenames provided."
    echo "Usage: ./script.sh <filename1> <filename2> ..."
    exit 1
fi

if [ "$#" -lt 2 ]; then
    echo "Error: Insufficient number of arguments for filenames. Need at least one file."
    echo "Usage: ./script.sh <filename1>"
    exit 1
fi

# Store the filenames in an array
filenames=("$@")

# Extract filenames
first_filename="${filenames[0]}"
second_filename="${filenames[1]}"


ffmpeg -i "$first_filename" -i "$second_filename" -filter_complex "[0:v]pad=iw*2:ih[bg]; [bg][1:v]overlay=w" assets/hstack.mp4
