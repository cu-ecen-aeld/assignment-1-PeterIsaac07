#!/bin/bash

# Check if arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required."
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory."
    exit 1
fi

# Function to count files and matching lines
function find_matches {
    local dir="$1"
    local str="$2"
    local file_count=0
    local line_count=0

    # Loop through files recursively
    while IFS= read -r -d '' file; do
        if [ -f "$file" ]; then
            (( file_count++ ))
            # Count matching lines
            match_count=$(grep -c "$str" "$file")
            (( line_count += match_count ))
        fi
    done < <(find "$dir" -type f -print0)

    echo "The number of files are $file_count and the number of matching lines are $line_count"
}

# Call function to find matches
find_matches "$filesdir" "$searchstr"

