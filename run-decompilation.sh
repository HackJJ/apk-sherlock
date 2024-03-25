#!/bin/bash

# Check if the APK file path is provided
if [ -z "$APK_FILE" ]; then
    echo "APK_FILE environment variable is not set."
    echo "Usage: docker run -e APK_FILE=/data/your_apk_file.apk -v /path/to/apk:/data -v /host/output/path:/workspace apktool-jadx-image"
    exit 1
fi

# Define the output directory
OUTPUT_DIR="/workspace/chcmob"

# Create output directory
mkdir -p "${OUTPUT_DIR}"

# Perform apktool decompilation
apktool d "$APK_FILE" -o "${OUTPUT_DIR}/decompiled"

# Perform jadx decompilation
jadx "$APK_FILE" -d "${OUTPUT_DIR}/java-code"

# Unzip the APK file
unzip "$APK_FILE" -d "${OUTPUT_DIR}/unzipped"
