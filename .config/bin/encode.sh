#!/bin/sh
# Author: zns
# Created: 2025-07-18
# Description: Find .MOV files in the Downloads directory, encode them, and delete the originals upon success.

# Directory containing .MOV files
source_dir="$HOME/Downloads/"

encode_and_delete() {
	input_file="$1"
	datestamp=$(date +"%Y-%m-%d")
	timestamp=$(date +"%H_%M_%S")
	output_file="$HOME/Downloads/${source_dir}${datestamp}-Chissoku_edge-Time-${timestamp}.mp4"

	echo "🎬 Starting encoding: $input_file"

	HandBrakeCLI -Z "Social 50 MB 5 Minutes 720p30" -i "$input_file" -o "$output_file"

	echo ""  # newline after progress bar

	if [ $? -eq 0 ]; then
		echo "✅ Encoding successful: $output_file"
		rm "$input_file"
	else
		echo "❌ Encoding failed: $input_file"
	fi
}

export -f encode_and_delete

# Find and process .MOV files in parallel (4 at a time)
find "$source_dir" -type f -name "*.MOV" -print0 | xargs -0 -n 1 -P 4 bash -c 'encode_and_delete "$0"'

