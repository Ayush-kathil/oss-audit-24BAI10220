#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Ayush | Course: Open Source Software

echo "=========================================="
echo " Open Source Manifesto Generator"
echo "=========================================="
echo ""

# --- User Input ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Date and file ---
DATE=$(date '+%d %B %Y')
USER=$(whoami)
OUTPUT="manifesto_$USER.txt"

# --- Generate manifesto ---
echo "------------------------------------------" > $OUTPUT
echo " Open Source Manifesto" >> $OUTPUT
echo "------------------------------------------" >> $OUTPUT
echo "Date: $DATE" >> $OUTPUT
echo "" >> $OUTPUT

echo "I believe in the power of open source." >> $OUTPUT
echo "Using tools like $TOOL, I experience true $FREEDOM in technology." >> $OUTPUT
echo "I believe knowledge should be shared, not restricted." >> $OUTPUT
echo "In the future, I aim to build $BUILD and make it freely available to everyone." >> $OUTPUT
echo "This is my contribution to the open-source community." >> $OUTPUT

echo "" >> $OUTPUT
echo "— $USER" >> $OUTPUT

# --- Output ---
echo ""
echo "Manifesto successfully generated!"
echo "Saved as: $OUTPUT"
echo ""

echo "Preview:"
echo "------------------------------------------"
cat $OUTPUT
echo "=========================================="
