#!/bin/bash

if [ "$#" -lt 3 ]; then
    echo "Error: Insufficient args provided."
    echo "Usage: ./script.sh <filename1> 00:00:05 00:00:10..."
    exit 1
fi

arguments=("$@")

video_file_name="${arguments[0]}"
extension="${video_file_name##*.}"

startTime="${arguments[1]}"
endTime="${arguments[2]}"

ffmpeg -loglevel quiet -i "$video_file_name" -ss "$startTime" -to "$endTime" -c:v copy -c:a copy assets/clip."${extension}"
