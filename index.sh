#!/bin/bash

# Check if the script is called with the correct number of arguments
if [ "$#" -lt 2 ]; then
    echo "Error: Invalid number of arguments."
    echo "Usage: sh script.sh <command_name> <filename1> <filename2> ..."
    exit 1
fi

# Extract the command name
command_name="$1"
command_script="./library/${command_name}.sh"

# Check if the command script exists
if [ ! -f "$command_script" ]; then
    echo "Error: Command script '$command_name' not found."
    exit 1
fi

shift

# Store the filenames in an array
filenames=("$@")

echo "Running command script: $command_script"
sh "$command_script" "${filenames[@]}"
