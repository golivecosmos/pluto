#!/bin/bash

# Check if the script is called with at least 4 arguments
if [ "$#" -lt 4 ]; then
    echo "Error: Insufficient number of arguments for filenames. Need at least 2 files."
    echo "Usage: ./script.sh transition duration <filename1> <filename2>..."
    exit 1
fi

# Store the filenames
arguments=("$@")

# Extract filenames
transition="${arguments[0]}"
duration="${arguments[1]}"
file_args="${@:3}"

IFS=' ' read -ra file_paths <<< "$file_args"

command="ffmpeg -y -hide_banner"
for f in "${file_paths[@]}"
do
    command="$command -loop 1 -i $f -t $duration"
done

count=$(awk -F' ' '{print NF}' <<< "$file_args")
offset=$(echo "scale=0; $duration/$count" | bc)
new_offset=$offset

filter_complex="[0:v][1:v]xfade=transition=${transition}:duration=0.5:offset=${offset}"

if [ "${count}" -gt 2 ]; then
    initial_tag="t0"
    filter_complex="$filter_complex[t0];"

    index=2
    new_offset=$((new_offset + offset))

    rem_files="${@:5}"
    IFS=' ' read -ra rem_file_paths <<< "$rem_files"
    
    for rf in "${rem_file_paths[@]}"
    do
        filter_complex="$filter_complex[${initial_tag}][${index}:v]xfade=transition=${transition}:duration=0.5:offset=${new_offset}"

        if [ "${index}" -eq "$((count-1))" ]; then
            filter_complex="$filter_complex[out]"
        else
            filter_complex="$filter_complex[t$index];"
            initial_tag="t$index"
        fi

        new_offset=$((new_offset + offset))
        index=$((index + 1))
    done
else
    filter_complex="$filter_complex[out]"
fi

final_command="$command -filter_complex $filter_complex -r 30 -c:v libx264 -map [out] -pix_fmt yuv420p -t $duration -preset superfast assets/slide_show.mp4"
$final_command
