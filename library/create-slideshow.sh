#!/bin/bash

# Check if the script is called with the correct number of arguments
if [ "$#" -eq 0 ]; then
    echo "Error: No filenames provided."
    echo "Usage: ./script.sh <filename1>"
    exit 1
fi

if [ "$#" -lt 2 ]; then
    echo "Error: Insufficient number of arguments for filenames. Need at least one file."
    echo "Usage: ./script.sh <filename1>"
    exit 1
fi

# Store the filenames
arguments=("$@")

# Extract filenames
transition="${arguments[0]}"
duration="${arguments[1]}"
fileArgs="${@:3}"

echo "${transition}"
echo "${fileArgs}"

IFS=' ' read -ra file_paths <<< "$fileArgs"

# ffmpeg -report -i "$video_file" -vf fps=$fps "${video_file%.*}"_%d.png
command="ffmpeg -hide_banner"
for f in "${file_paths[@]}"
do
    command="$command -loop 1 -i $f -t $duration"
done

filter_complex="[0:v][1:v]xfade=transition=hrslice:duration=1:offset=3 [p0]"

final_command="$command '$filter_complex' -r 30 -c:v libx264 -map [p0] -pix_fmt yuv420 -t $duration assets/out.mp4"

$final_command

    