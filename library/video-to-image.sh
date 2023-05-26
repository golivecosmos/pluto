#!/bin/bash

# Check if the script is called with the correct number of arguments
if [ "$#" -eq 0 ]; then
    echo "Error: No filenames provided."
    echo "Usage: ./script.sh <filename1>"
    exit 1
fi

if [ "$#" -lt 1 ]; then
    echo "Error: Insufficient number of arguments for filenames. Need at least one file."
    echo "Usage: ./script.sh <filename1>"
    exit 1
fi

# Store the filenames
arguments=("$@")

# Extract filenames
video_file="${arguments[0]}"
fps="${arguments[1]:-1}"

ffmpeg -i "$video_file" -vf fps=$fps "${video_file%.*}"_%d.png
