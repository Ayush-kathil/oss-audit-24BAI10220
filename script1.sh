#!/bin/bash
# Script 1: System Identity Report
# Author: Ayush | Course: Open Source Software

# --- Variables ---
STUDENT_NAME="Ayush"
SOFTWARE_CHOICE="Git"

# --- System Info ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
DATE=$(date)
DISTRO=$(lsb_release -d | cut -f2)

# --- Display ---
echo "=========================================="
echo " Open Source Audit — $STUDENT_NAME"
echo "=========================================="
echo "Chosen Software : $SOFTWARE_CHOICE"
echo "Distribution    : $DISTRO"
echo "Kernel Version  : $KERNEL"
echo "User            : $USER_NAME"
echo "Uptime          : $UPTIME"
echo "Date & Time     : $DATE"
echo "------------------------------------------"
echo "License Note    : Linux is distributed under the GNU General Public License (GPL)"
echo "=========================================="











