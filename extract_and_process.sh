#!/bin/bash

# Define the directory containing the .tar.gz files
DIR=""

# Define the directory where the files will be extracted
EXTRACT_DIR="extracted_images"

# Create the extraction directory if it doesn't exist
mkdir -p "$EXTRACT_DIR/"

# Loop through all .tar.gz files in the specified directory and extract them
for FILE in "$DIR"*.tar.gz; do
    if [[ -f "$FILE" ]]; then
        echo "Extracting $FILE..."
        tar -xzvf "$FILE" -C "$EXTRACT_DIR"
        echo "Extracted $FILE to $EXTRACT_DIR"

        # Call the Python script to process the extracted images
        python3 process_images.py "$EXTRACT_DIR"
    else
        echo "No .tar.gz files found in $DIR"
    fi
done
