#!/bin/bash

# Check if the script is called with the correct number of arguments
if [ "$#" -eq 0 ]; then
    echo "Error: No filenames provided."
    echo "Usage: ./script.sh <filename1> <filename2> ..."
    exit 1
fi

if [ "$#" -lt 2 ]; then
    echo "Error: Insufficient number of arguments for filenames. Need at least one PDF file and one audio file."
    echo "Usage: ./script.sh <filename1> <filename2> ..."
    exit 1
fi

# Store the filenames in an array
filenames=("$@")

# Extract filenames
first_filename="${filenames[0]}"
second_filename="${filenames[1]}"

# convert PDF into a set of images
convert -density 300 "$first_filename" -colorspace sRGB -alpha off -quality 100 "${first_filename%.*}-%03d.png"

# convert set of images into a video with audio
ffmpeg -framerate 0.25 \
-i "${first_filename%.*}"-%03d.png \
-i "$second_filename" \
-vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" \
-c:v libx264 -pix_fmt yuv420p \
-c:a copy \
-t $(echo $(($(ls -1q "${first_filename%.*}"-*.png | wc -l) * 4))) \
"${first_filename%.*}".mp4