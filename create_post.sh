#!/bin/bash

# Check if title is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 \"Your Post Title\" [filename.md]"
    echo "Example: $0 \"My New Blog Post\""
    echo "Or with custom filename: $0 \"My New Blog Post\" custom-filename.md"
    exit 1
fi

# Set variables
TITLE="$1"
CURRENT_DATE=$(date +"%Y-%m-%d")
CURRENT_DATETIME=$(date +"%Y-%m-%d %H:%M:%S %z")

# Use custom filename if provided, otherwise generate from title
if [ $# -ge 2 ] && [ -n "$2" ]; then
    FILENAME="$2"
    # Add .md extension if not present
    if [[ $FILENAME != *.md ]]; then
        FILENAME="${FILENAME}.md"
    fi
else
    # Create filename from title
    FILENAME="${CURRENT_DATE}-$(echo "${TITLE}" | tr '[:upper:] ' '[:lower:]-' | tr -d '[:punct:]' | tr -s '-').md"
fi

# Set posts directory - simply use _posts in the current directory
POSTS_DIR="_posts"

# Ensure the posts directory exists
mkdir -p "${POSTS_DIR}"

# Create the post file
cat > "${POSTS_DIR}/${FILENAME}" << EOF
---
layout: post
title:  "${TITLE}"
date:   ${CURRENT_DATETIME}
categories: blog
---
Write your content here.
EOF

echo "New post created at ${POSTS_DIR}/${FILENAME}"
ls -la "${POSTS_DIR}/${FILENAME}" 