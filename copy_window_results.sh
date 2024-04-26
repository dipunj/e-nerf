#!/bin/bash

# Get today's date in YYYY-MM-DD format
today=$(date +%F)

# Define the output directory path
outdir="OUTDIR/MONTH-DAY/esim"

# Iterate over window sizes from 30 to 180 with a step size of 30
for window_size in {30..180..30}
do
    # Construct the source directory path
    source_dir="${outdir}/${today}_window_${window_size}/configs/spiral2_spiral2_enerf/run/${today}_window_${window_size}"
    
    # Find the source file in the source directory
    source_file=$(find "$source_dir" -maxdepth 1 -type f -name "*.edu" -print -quit)

    # Check if the source file exists
    if [ -f "$source_file" ]; then
        # Construct the destination directory path
        dest_dir="final_results/${today}"

        # Create the destination directory if it doesn't exist
        mkdir -p "$dest_dir"
        
        # Construct the destination file name
        dest_file="${dest_dir}/${window_size}.tf"

        # Copy the file to the destination directory with the correct name
        cp "$source_file" "$dest_file"
    else
        echo "File not found: $source_dir/*.edu"
    fi
done
