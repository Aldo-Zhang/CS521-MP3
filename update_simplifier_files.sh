#!/bin/bash

# Define source and target directories
SRC_DIR="/home/ec2-user/mp3_code/CS521-MP3"
TARGET_DIR="/home/ec2-user/xla/xla/hlo/transforms/simplifiers"

# Define file names
FILES=("algebraic_simplifier.cc" "algebraic_simplifier_test.cc")

# Copy each file and overwrite the target
for FILE in "${FILES[@]}"; do
    if [ -f "$SRC_DIR/$FILE" ]; then
        echo "Updating $FILE..."
        cp "$SRC_DIR/$FILE" "$TARGET_DIR/$FILE"
    else
        echo "Warning: $SRC_DIR/$FILE not found!"
    fi
done

echo "✅ All specified files have been updated."