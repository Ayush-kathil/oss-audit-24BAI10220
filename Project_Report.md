# Capstone Project: Open Source Software Audit
**Student Name:** Ayush Gupta  
**Registration Number:** 24BAI10220  
**Course:** Open Source Software  
**Subject Audited:** Git (Version Control System)  
**License:** GNU General Public License v2 (GPL v2)  

---

## 1. The Problem Chosen
For my capstone project, I decided to audit Git. I didn't just want to write a history report on open-source software, though. I wanted to understand how open-source licensing actually protects code, and then practically apply that knowledge by writing automated bash scripts that can monitor the health of a Linux environment running open-source tools. The goal was to bridge the gap between the theory of open source (copyleft licenses, distributed architecture) and the actual command-line work required to maintain these systems.

## 2. Why This Problem Matters
Before 2005, the Linux kernel team actually used a proprietary tool called BitKeeper for their version control. The company behind BitKeeper offered a free license to the community, but eventually revoked it over a dispute. Suddenly, the biggest open-source project in the world lost its version control system overnight. This event is a massive lesson: if the tools we use to build free software aren't open source themselves, the community can be held hostage by a single vendor. 

That's why Linus Torvalds built Git. He distributed it under the GPL v2 license. This license is "copyleft"—meaning anyone who modifies and distributes Git has to also release their modifications under the exact same open license. Understanding this matters because traditional copyright law restricts sharing, but GPL v2 uses that same legal framework to guarantee that the code stays publicly available forever. 

From a system administration perspective, this project matters because tools like Git rely heavily on the Linux operating system. Automating Linux health checks via bash scripting is a required skill to ensure these open-source tools are running smoothly and securely.

## 3. Approach to Solving the Problem
My approach was split into two parts: research and scripting. 

First, I researched how decentralized systems like Git physically differ from older centralized systems like Subversion (SVN) or Perforce. I focused on how decentralization gives every developer a full backup of a project, removing single points of failure.

For the practical portion, I logged into a Linux terminal and wrote five custom Bash shell scripts. Instead of just searching for the word "git" randomly, I structured my scripts to use standard Linux utilities (like `dpkg`, `awk`, `grep`, and `du`). The goal was to automate tasks like checking system distribution, querying package managers for exact installation status, calculating file permissions around critical directories, and filtering server logs for errors.

## 4. Key Technical Decisions
I had to make a few design choices while writing the bash toolkit:
- **Avoiding root access:** I designed the disk and permission scripts to run without `sudo`. Open-source security relies on strict permissions, so I wanted my scripts to handle restricted directories cleanly without crashing or requiring top-level access.
- **Using dpkg:** In the package inspector script, I chose to query `dpkg` directly rather than just running `git --version`. This ensures I get the real deb-package installation status and metadata straight from the OS layer.
- **Making it interactive:** For the manifesto generator, I decided to use `read -p` to take keyboard input. I felt the project needed a human element, so rather than just printing static text, the script prompts the user about their open-source philosophy and generates a custom `.txt` file automatically based on their answers.

## 5. Challenges Faced During Implementation
Writing the log analysis script highlighted how messy system logs can be. When scanning `/var/log/syslog`, I initially struggled to pull out relevant failures without capturing too much random system noise. I solved this by implementing a case-insensitive `grep -iq` check inside a `while read` loop, and allowed the script to accept custom keywords via command-line arguments (defaulting to "error"). 

Another annoying issue came up during the directory audit. Running `du -sh` on restricted folders like `/var/log` threw a lot of messy permission errors onto my screen. I learned to use `2>/dev/null` to quietly dump those specific errors, which kept the final output table completely clean and readable on the console.

## 6. What I Learned
This project gave me a much clearer picture of how dependent we are on open-source foundations. I learned that Git is basically a massive puzzle of other free tools—it uses `zlib` to compress data and `OpenSSH` to securely transfer code over the network. 

On the coding side, my comfort level with the Linux command line improved significantly. I learned how to use `awk` to extract exact columns from `ls -ld` outputs, how to manage variables inside bash scripts, and how file permissions (`drwxr-xr-x`) physically secure a system. Overall, this audit taught me that open source isn't just about sharing code out of generosity; it's an incredibly technical and legally protected development model capable of producing the best software in the world.

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
