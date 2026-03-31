# Capstone Project: Open Source Software Audit
**Student Name:** Ayush Gupta  
**Registration Number:** 24BAI10220  
**Course:** Open Source Software  
**Subject Audited:** Git (Version Control System)  
**License:** GNU General Public License v2 (GPL v2)  

---

## 1. The Problem Chosen
The core problem addressed in this Capstone Project is conducting a comprehensive, dual-layered audit of **Git**—the decentralized version control system that serves as the foundation of modern software engineering. 

The task required moving beyond a surface-level definition of "open source." The problem was to theoretically deconstruct how Git's licensing (GPL v2) and architecture (distributed) protect software from proprietary capture, while practically demonstrating how to maintain and audit the Linux environments that host such critical open-source software. To solve the practical side, I developed a suite of five automated Bash shell scripts designed to perform system reconnaissance, package inspection, security auditing, and log analysis.

## 2. Why This Problem Matters
Understanding the foundations of open-source software is an ethical and technical imperative for modern developers. 

**The Historical Context:** Prior to 2005, the Linux kernel was managed via a proprietary version control system called BitKeeper. When the vendor abruptly revoked the "free" license they had extended to the Linux community, development of the world's most critical operating system ground to a halt. Linus Torvalds engineered Git as a direct response to this crisis. By auditing Git, we are examining a tool forged explicitly to ensure that open-source communities are never held hostage by proprietary vendors again.

**The Licensing Imperative:** Git is licensed under the GNU General Public License version 2 (GPLv2). This is a "copyleft" license. If a corporation modifies Git and distributes it, GPLv2 legally mandates that they must release those modifications under the same free license. Auditing this ensures we understand how traditional copyright law is weaponized to keep software permanently in the public commons. 

From a system administration perspective, auditing matters because open-source tools do not run in a vacuum. Git relies on the Linux OS, OpenSSH for secure transport, and `zlib` for data compression. Automating the health checks of the Linux environment (via Bash scripting) is critical because the security of Git repositories depends entirely on the file permissions of the host machine.

## 3. Approach to Solving the Problem
My approach was divided into theoretical research and practical execution.

**Theoretical Research:** I analyzed the architectural differences between centralized proprietary systems (like SVN or Perforce) and decentralized OSS systems (like Git). I explored how decentralized models democratize data ownership by providing every developer with a full, cryptographic clone of the repository history.

**Practical Execution (Bash Automation):** To practically audit the Linux environment hosting these open-source tools, I engineered five POSIX-compliant Bash scripts. My approach was to use standard GNU core utilities (`awk`, `grep`, `du`, `uname`) to build tools that interact naturally with the Linux Filesystem Hierarchy Standard (FHS). 
- I built a `System Reconnaissance` script to capture the baseline kernel and distribution.
- I built a `Package Inspector` to proactively query the package manager (`dpkg`) to verify Git's installation.
- I built a `Security Auditor` to traverse directory trees and calculate storage and permission string integrity.

## 4. Key Technical Decisions
Several critical decisions shaped the architecture of my Bash auditing toolkit:
1. **Avoiding Root Privileges:** I deliberately designed the scripts to run without `sudo` access where possible. Open-source environments prioritize the principle of least privilege. My scripts gracefully handle permission-denied errors (e.g., routing errors to `/dev/null`) rather than crashing when they hit a protected system directory.
2. **Dynamic Package Management Checking:** Rather than just looking for an executable, I decided to use `dpkg` to query the Deb-based package registry. This decision ensures I get the formal installation status, exact versioning, and repository metadata, which is much more robust than simply running `git --version`.
3. **Interactive Manifesto Generation:** For the final script, I made the key decision to use interactive terminal input (`read -p`). Instead of just dumping data, this captures the user's personal ideology regarding open source and programmatically writes it to a `.txt` manifesto, bridging technical automation with the human element of FOSS.

## 5. Challenges Faced During Implementation
1. **Handling Unpredictable Log Formatting:** While writing the *Automated Log Parsing* script, I realized system logs (`/var/log/syslog`) are dense and inconsistently formatted. *Challenge:* How do I accurately find application faults? *Solution:* I implemented a case-insensitive reading loop (`grep -iq`) combined with dynamic positional parameters (`$1` and `${2:-"error"}`), allowing the administrator to filter for generic anomalies gracefully without needing complex Regex patterns.
2. **Graceful Error Handling with Storage:** When auditing directory sizes using `du -sh` on system directories like `/var/log` without root privileges, the terminal was flooded with "Permission denied" errors, ruining the script's output. *Solution:* I utilized standard error redirection (`2>/dev/null`) to silence these specific warnings, allowing the script to report valid sizes for accessible data while remaining visually clean in the console.

## 6. What I Learned
Through this Capstone, I gained a profound understanding of both the ideology and infrastructure of open-source development. 
- **Ideologically:** I learned that "free software" (as in freedom, not free beer) is paramount. I understand how copyleft licenses protect user rights, and how platforms like GitHub were only made possible because the underlying Git protocol was open and distributed.
- **Technically:** My Linux command-line proficiency increased immensely. I learned how to weave `awk` and `grep` pipelines inside loops to extract precise metadata. I learned how Linux manages file permissions cryptographically (`drwxr-xr-x`), and how bash scripts can manipulate standard input/output streams to automate system-level health verification. 

This project reinforced that open source is human collaboration compounded by technology, and maintaining that technology requires capable automation.

---

## 7. Appendix: Practical Bash Automation Toolkit
*Below is the documented source code from the five Bash scripts evaluated during the practical portion of this audit.*

### Script 1: System Reconnaissance (`script1.sh`)
```bash
#!/bin/bash
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
# ... (Formatting commands) ...
echo "License Note    : Linux is distributed under the GNU General Public License (GPL)"
```

### Script 2: FOSS Package Inspector (`script2.sh`)
```bash
#!/bin/bash
PACKAGE="git"
# --- Check if package is installed ---
if dpkg -l | grep -qw "$PACKAGE"; then
    echo "$PACKAGE is installed on this system."
    VERSION=$(git --version | awk '{print $3}')
    echo "Version: $VERSION"
    dpkg -s $PACKAGE | grep -E 'Status|Priority|Section'
else
    echo "$PACKAGE is NOT installed."
fi

# ... case statement mapping packages (git, apache2, firefox) to philosophy notes ...
```

### Script 3: Security & Resource Auditor (`script3.sh`)
```bash
#!/bin/bash
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

# --- Loop through directories ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld $DIR | awk '{print $1}')
        OWNER=$(ls -ld $DIR | awk '{print $3}')
        GROUP=$(ls -ld $DIR | awk '{print $4}')
        SIZE=$(du -sh $DIR 2>/dev/null | cut -f1)
        # ... echo outputs ...
    fi
done
# ... Additional validation targeting the ~/.gitconfig file permissions ...
```

### Script 4: Automated Log Parsing (`script4.sh`)
```bash
#!/bin/bash
LOGFILE=$1
KEYWORD=${2:-"error"}   # Default keyword = error
COUNT=0

# ... validation logic ...
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
```

### Script 5: The OSS Philosophy Generator (`script5.sh`)
```bash
#!/bin/bash
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
USER=$(whoami)
OUTPUT="manifesto_$USER.txt"

# --- Generate manifesto ---
echo "------------------------------------------" > $OUTPUT
echo " Open Source Manifesto" >> $OUTPUT
echo "Date: $DATE" >> $OUTPUT
echo "Using tools like $TOOL, I experience true $FREEDOM in technology." >> $OUTPUT
# ... prints final output ...
```
