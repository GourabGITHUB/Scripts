#!/bin/bash

# Basic script to safely delete Google Chrome's main temporary web cache data.

CHROME_MAIN_CACHE_DIR="$HOME/.cache/google-chrome/Default/Cache"

# --- Step 1: Check if Chrome is running ---
if pgrep -x "chrome" > /dev/null || pgrep -x "chromium" > /dev/null; then
    echo "ERROR: Chrome is running. Please close all Chrome windows before running this script."
    exit 1
fi

# --- Step 2: Show disk usage of the main Cache directory ---
echo "--- Google Chrome Main Cache Cleaner ---"
echo "Calculating usage of '$CHROME_MAIN_CACHE_DIR'..."

if [ -d "$CHROME_MAIN_CACHE_DIR" ]; then
    TOTAL_USAGE_BYTES=$(du -sb "$CHROME_MAIN_CACHE_DIR" 2>/dev/null | awk '{print $1}')
    if (( TOTAL_USAGE_BYTES > 0 )); then
        echo "Estimated usage of main web cache: $(numfmt --to=iec-bytes $TOTAL_USAGE_BYTES)"
    else
        echo "Main web cache directory exists but appears empty."
        echo "No data to clear. Exiting."
        exit 0
    fi
else
    echo "Main web cache directory '$CHROME_MAIN_CACHE_DIR' not found."
    echo "This might mean Chrome is not installed, not used, or your profile path is different."
    echo "No data to clear. Exiting."
    exit 0
fi

echo ""

# --- Step 3: Ask for confirmation and delete upon approval ---
read -p "Are you sure you want to clear this main web cache data? (y/N): " -n 1 -r
echo

if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    echo "Clearing main web cache..."
    # Using find -mindepth 1 -delete is safer and more robust than rm -rf TARGET_DIR/*
    find "$CHROME_MAIN_CACHE_DIR" -mindepth 1 -delete 2>/dev/null
    echo "Main web cache cleaning complete. Restart Chrome for changes to take effect."
    echo "Initial website loading might be slower as the cache is rebuilt."
else
    echo "Cache cleaning cancelled."
fi

exit 0
