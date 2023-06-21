#!/bin/bash

# Check if the script is called with the correct number of arguments
if [ "$#" -lt 1 ]; then
    echo "Error: Insufficient number of arguments for filenames. Need at least one file."
    echo "Usage: ./script.sh <filename1>"
    exit 1
fi

# Store the filenames in an array
filenames=("$@")

# Extract filenames
first_filename="${filenames[0]}"

ffmpeg -loglevel quiet -i "$first_filename" "${first_filename%.*}".gif