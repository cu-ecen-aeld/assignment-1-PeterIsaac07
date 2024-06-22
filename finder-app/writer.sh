#!/bin/bash

# Check if arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required."
    exit 1
fi

writefile="$1"
writestr="$2"

# Check if writefile is specified
if [ -z "$writefile" ]; then
    echo "Error: File path not specified."
    exit 1
fi

# Check if writestr is specified
if [ -z "$writestr" ]; then
    echo "Error: Text string not specified."
    exit 1
fi

# Create directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write content to file
echo "$writestr" > "$writefile"

# Check if file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: Failed to create file $writefile."
    exit 1
fi

echo "File $writefile created successfully with content:"
echo "$writestr"

