#!/bin/bash

# Check if the script is called with at least 4 arguments
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

IFS=' ' read -ra file_paths <<< "$fileArgs"

command="ffmpeg -y -hide_banner"
for f in "${file_paths[@]}"
do
    command="$command -loop 1 -i $f -t $duration"
done

count=$(awk -F' ' '{print NF}' <<< "$fileArgs")
offset=$(echo "scale=0; $duration/$count" | bc)

filter_complex="[0:v][1:v]xfade=transition=${transition}:duration=0.5:offset=${offset}"

if [ "${count}" -gt 2 ]; then
    filter_complex="$filter_complex[t0];"

    index=2
    newOffset=$((offset + offset))

    rem_files="${@:5}"
    for rf in "$rem_files"
    do
        filter_complex="$filter_complex[t0][${index}:v]xfade=transition=${transition}:duration=0.5:offset=${newOffset}"
        index=$((index + 1))

        # complete
        if [ "${index}" -eq "${count}" ]; then
            filter_complex="$filter_complex[out]"
        else
            filter_complex="$filter_complex[t$index]"
        fi
    done
else
    filter_complex="$filter_complex[out]"
fi

final_command="$command -filter_complex $filter_complex -r 30 -c:v libx264 -map [out] -pix_fmt yuv420p -t $duration -preset superfast assets/slideshow.mp4"

$final_command
