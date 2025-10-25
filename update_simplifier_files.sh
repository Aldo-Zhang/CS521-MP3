#!/bin/bash

# ==============================
# 1️⃣ Define source and target
# ==============================
SRC_DIR="/home/ec2-user/mp3_code/CS521-MP3"
TARGET_DIR="/home/ec2-user/xla/xla/hlo/transforms/simplifiers"

# ==============================
# 2️⃣ Files to be copied
# ==============================
FILES=("algebraic_simplifier.cc" "algebraic_simplifier_test.cc")

# ==============================
# 3️⃣ Copy and overwrite files
# ==============================
for FILE in "${FILES[@]}"; do
    if [ -f "$SRC_DIR/$FILE" ]; then
        echo "Updating $FILE..."
        cp "$SRC_DIR/$FILE" "$TARGET_DIR/$FILE"
    else
        echo "⚠️ Warning: $SRC_DIR/$FILE not found!"
    fi
done

echo "✅ All specified files have been updated."

# ==============================
# 4️⃣ Activate environment & navigate
# ==============================
echo "Activating Conda environment..."
source ~/miniconda3/bin/activate
conda activate mp3
cd ~/xla || exit
echo "Environment 'mp3' activated and directory changed to ~/xla."