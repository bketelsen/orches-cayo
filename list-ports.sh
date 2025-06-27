#!/bin/bash

# Script to extract published ports from .container files and display in markdown table

echo "## Container Port Mappings"
echo ""
echo "| Container File | Published Ports |"
echo "|----------------|-----------------|"

# Find all .container files in current directory
for container_file in *.container; do
    # Check if any .container files exist
    if [ ! -f "$container_file" ]; then
        echo "No .container files found in current directory"
        exit 1
    fi

    # Extract published ports from the file
    ports=$(grep "^PublishPort=" "$container_file" | sed 's/PublishPort=//' | tr '\n' ', ' | sed 's/, $//')

    # If no ports found, show "None"
    if [ -z "$ports" ]; then
        ports="None"
    fi

    # Output in markdown table format
    echo "| $container_file | $ports |"
done
