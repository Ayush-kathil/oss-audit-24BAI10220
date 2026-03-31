#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Ayush | Course: Open Source Software

# --- Directories to check ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=========================================="
echo " Directory Audit Report"
echo "=========================================="

# --- Loop through directories ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        
        # Get permissions, owner, group
        PERMS=$(ls -ld $DIR | awk '{print $1}')
        OWNER=$(ls -ld $DIR | awk '{print $3}')
        GROUP=$(ls -ld $DIR | awk '{print $4}')
        
        # Get size
        SIZE=$(du -sh $DIR 2>/dev/null | cut -f1)

        echo "Directory : $DIR"
        echo "Permissions: $PERMS"
        echo "Owner      : $OWNER"
        echo "Group      : $GROUP"
        echo "Size       : $SIZE"
        echo "------------------------------------------"
    else
        echo "$DIR does not exist."
    fi
done

# --- Additional: Check Git config directory ---
echo ""
echo "Checking Git configuration directory..."
GIT_CONFIG="$HOME/.gitconfig"

if [ -f "$GIT_CONFIG" ]; then
    PERMS=$(ls -l $GIT_CONFIG | awk '{print $1, $3, $4}')
    echo "Git Config Found!"
    echo "Permissions, Owner, Group: $PERMS"
else
    echo "Git config file not found."
fi

echo "=========================================="
