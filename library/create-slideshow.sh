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
# Check min fileArg length

IFS=' ' read -ra file_paths <<< "$fileArgs"

command="ffmpeg -report -y -hide_banner"
for f in "${file_paths[@]}"
do
    command="$command -loop 1 -i $f -t $duration"
done

count=$(awk -F' ' '{print NF}' <<< "$fileArgs")
offset=$(echo "scale=2; $duration/$count" | bc)

filter_complex="[0:v][1:v]xfade=transition=${transition}:duration=1:offset=${offset}"

if [ "${length}" -gt 2 ]; then
    filter_complex="$filter_complex [t0];"

    index=2
    newOffset=$offset+$offset
    for rem_files in "$fileArgs[2]"
    do
        filter_complex="[t0][v:${index}]xfade=transition=${transition}:duration=1:offset=${offset}"
        if [ "${index}" -eq "$index"-1]; then
            filter_complex="$filter_complex[out]"
        else
            filter_complex="$filter_complex[t$index]"
        fi

        index=$((index + 1))
    done
else
    filter_complex="$filter_complex[out]"
fi

final_command="$command -filter_complex $filter_complex -r 30 -c:v libx264 -map [out] -pix_fmt yuv420p -t $duration -preset superfast assets/slideshow.mp4"

echo "$final_command"
$final_command

    