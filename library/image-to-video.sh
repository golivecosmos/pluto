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
image_file="${arguments[0]}"
fps="${arguments[1]:-24}"
duration="${arguments[2]:-10}"

ffmpeg -loop 1 -framerate "$fps" -i "$image_file" -c:v libx264 -pix_fmt yuv420p -t "$duration" "${image_file%.*}".mp4

