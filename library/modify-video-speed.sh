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
video_file_name="${arguments[0]}"
speed="${arguments[1]:-0.5}"

extension="${video_file_name##*.}"

content_duration=`ffprobe -v quiet -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "${video_file_name}"`

new_content_duration=$(echo "$content_duration * $speed" | bc)

ffmpeg -v quiet -i "$video_file_name" -filter:v "setpts=$speed*PTS" -t "$new_content_duration" "${video_file_name%.*}_${speed}x"."${extension}"
