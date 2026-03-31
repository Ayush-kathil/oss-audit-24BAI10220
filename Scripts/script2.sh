#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Ayush | Course: Open Source Software

# --- Input ---
PACKAGE="git"

echo "=========================================="
echo " FOSS Package Inspector"
echo "=========================================="

# --- Check if package is installed ---
if dpkg -l | grep -qw "$PACKAGE"; then
    echo "$PACKAGE is installed on this system."

    # --- Get version ---
    VERSION=$(git --version | awk '{print $3}')
    echo "Version: $VERSION"

    # --- Get additional package info ---
    echo "Package Details:"
    dpkg -s $PACKAGE | grep -E 'Status|Priority|Section'

else
    echo "$PACKAGE is NOT installed."
fi

echo "------------------------------------------"

# --- Case statement for philosophy note ---
case $PACKAGE in
    git)
        echo "Git: A distributed version control system that enables collaborative and open development."
        ;;
    apache2)
        echo "Apache: The web server that helped build the modern open internet."
        ;;
    mysql-server)
        echo "MySQL: A widely used open-source database powering millions of applications."
        ;;
    firefox)
        echo "Firefox: A browser promoting privacy and an open web."
        ;;
    *)
        echo "Unknown package. No philosophy note available."
        ;;
esac

echo "=========================================="

