#!/bin/bash

# Create covers directory if it doesn't exist
mkdir -p covers

# Extract all image URLs from dreamcast_games_demul.html
grep -o 'https://d29xot63vimef3\.cloudfront\.net/image/dreamcast-games/[0-9]\+-1\.jpg' dreamcast_games_demul.html | sort -u | while read -r url; do
    # Extract filename from URL (e.g., 232-1.jpg)
    filename=$(basename "$url")
    
    echo "Downloading $filename..."
    
    # Download the file to covers/ directory
    curl -L -o "covers/$filename" "$url"
    
    # Optional: Add a small delay to be nice to the server
    sleep 0.5
done

echo "Download complete!"