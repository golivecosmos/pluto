#!/bin/bash

# Check if the script is called with the correct number of arguments
if [ "$#" -eq 0 ]; then
    echo "Error: No filenames provided."
    echo "Usage: ./script.sh <filename1>"
    exit 1
fi

# TODO add error message
if [ "$#" -lt 4 ]; then
    echo "Error: Insufficient number of arguments for filenames. Need at least TODO: fill this out."
    echo "Usage: ./script.sh <filename1>"
    exit 1
fi

# Store the filenames
arguments=("$@")

# Extract filenames
transition="${arguments[0]}"
duration="${arguments[1]}"
fileArgs="${@:3}"

# TODO
# Check valid transition
# Check duration limit
# Check min fileArg length

IFS=' ' read -ra file_paths <<< "$fileArgs"

command="ffmpeg -report -y -hide_banner"
for f in "${file_paths[@]}"
do
    command="$command -loop 1 -i $f -t $duration"
done

filter_complex="[0:v][1:v]xfade=transition=${transition}:duration=1:offset=3[p0]"

final_command="$command -filter_complex $filter_complex -r 30 -c:v libx264 -map [p0] -pix_fmt yuv420p -t $duration -preset superfast assets/slideshow.mp4"

$final_command

    