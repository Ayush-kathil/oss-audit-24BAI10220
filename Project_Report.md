---
# Capstone Project: Open Source Software Audit
**Student Name:** Ayush Gupta  
**Registration Number:** 24BAI10220  
**Course:** Open Source Software  
**Subject Audited:** Git (Version Control System)  
**License:** GNU General Public License v2 (GPL v2)  
---

## Table of Contents
1. **Introduction** 
2. **Part A — Genesis and Ideology** 
   - 2.1 The BitKeeper Incident 
   - 2.2 Unpacking the GPL v2 License
   - 2.3 The Ethical Imperative of Open Source
3. **Part B — System Architecture and Linux Integration** 
   - 3.1 Package Deployment
   - 3.2 Anatomy of the `.git` Directory
4. **Part C — The Symbiotic FOSS Ecosystem** 
5. **Part D — Paradigm Shift: Open Source vs Proprietary** 
6. **Part E — Practical Audit: Bash Automation Toolkit** 
   - Script 1: System Reconnaissance
   - Script 2: FOSS Package Inspector
   - Script 3: Security & Resource Auditor
   - Script 4: Automated Log Parsing
   - Script 5: The OSS Philosophy Generator
7. **Conclusion** 

---

## 1. Introduction

The Open Source Software (OSS) movement is more than just a method of licensing code; it is a fundamental restructuring of how human knowledge is generated, maintained, and shared. This capstone audit serves as an empirical and philosophical investigation into **Git**, the decentralized version control system that serves as the bedrock for modern software engineering. 

The objective of this project is to transcend a surface-level understanding of open source. Through a meticulous audit of Git, this report will trace the historical circumstances of its controversial birth, deconstruct the legal mechanics of its GNU General Public License (GPL) v2, and examine its technical footprint within a Linux ecosystem. To bridge the gap between theory and execution, this report culminates in Part E, detailing five original Bash shell scripts engineered to automate the system-level auditing processes crucial to maintaining an open-source infrastructure.

Git was not developed in a corporate boardroom. It was forged in a moment of existential crisis for the Linux kernel community—a crisis triggered by a proprietary vendor. By analyzing Git, we are observing the ultimate triumph of the open-source philosophy: the realization that the tools used to build free software must themselves be irrevocably free.

---

## 2. Part A — Genesis and Ideology

### 2.1 The BitKeeper Incident: A Catalyst for Revolution
Prior to 2005, the Linux kernel—arguably the most complex collaborative engineering project in human history—was managed via a proprietary version control system known as **BitKeeper**. While BitMover Inc. provided a free-of-charge license to the Linux community, the arrangement was fundamentally precarious. "Free of charge" is a business strategy, not an unalienable right.

This fragility was exposed in April 2005 when an open-source developer reverse-engineered the BitKeeper protocol to improve interoperability. Viewing this as a violation of their terms of service, BitMover abruptly revoked the free license for the entire Linux community. Overnight, the development pipeline of the internet's most critical operating system was paralyzed.

In response, Linus Torvalds, the creator of Linux, vanished coding for ten days. He refused to regress to archaic, centralized systems like Apache Subversion (SVN) or CVS. Instead, he wrote the initial prototype for Git. His architectural vision was radical: a system where every single developer possessed a total, cryptographic clone of the entire repository history. There would be no single point of failure, no central authority, and crucially, no proprietary vendor that could ever revoke access again. Git was born as a digital declaration of independence.

### 2.2 Unpacking the GPL v2 License
Git is licensed under the **GNU General Public License version 2 (GPLv2)**, drafted by the Free Software Foundation. To comprehend the magnitude of this, one must understand the distinct difference between permissive licenses (like MIT) and copyleft licenses (like GPL).

GPLv2 guarantees the "Four Essential Freedoms":
1. **Freedom 0:** The freedom to run the program as you wish, for any purpose.
2. **Freedom 1:** The freedom to study how the program works, and change it. (Access to the source code is a precondition for this).
3. **Freedom 2:** The freedom to redistribute copies so you can help others.
4. **Freedom 3:** The freedom to distribute copies of your modified versions to others.

What makes GPLv2 profoundly powerful is its algorithmic viral nature, known as **copyleft**. If an organization modifies Git's source code and distributes that modified version, GPLv2 legally mandates that they must also release their modified source code under the exact same GPLv2 license. It weaponizes traditional copyright law to guarantee that the software, and all its future evolutionary branches, remain permanently in the public commons. Git can never be enclosed.

### 2.3 The Ethical Imperative of Open Source
"Standing on the shoulders of giants" is the defining axiom of modern computing. When I compile a program, I am relying on the GCC compiler written by thousands of volunteers. When I push code to GitHub, my HTTP requests are encrypted by OpenSSL. We do not reinvent the wheel because the open-source social contract dictates that once a foundational problem is solved, the solution belongs to humanity.

The ethics of open source dictate that restricting access to software knowledge artificially hinders human innovation. Proprietary software acts as a black box—users must blindly trust the vendor regarding security, privacy, and longevity. Open source operates on the principle of peer review: transparency breeds security. Git embodies this ethos perfectly; it is a tool built by developers, for developers, fundamentally prioritizing the integrity of the collective over the profit margins of a corporation.

---

## 3. Part B — System Architecture and Linux Integration

### 3.1 Package Deployment and the FHS
Auditing Git requires understanding its symbiotic relationship with the Linux operating system. On a Debian or Ubuntu system, Git is deployed via the Advanced Package Tool (`sudo apt install git`). This process resolves dependencies dynamically, downloading compiled binaries curated and cryptographically signed by distribution maintainers. 

Once deployed, Git scatters its components across the Linux Filesystem Hierarchy Standard (FHS):
- The core executable binary resides in `/usr/bin/git`.
- Auxiliary scripts, core commands, and repository templates live in `/usr/lib/git-core/`.
- System-wide configuration files are placed in `/etc/gitconfig`, while user-specific overrides exist securely in `~/.gitconfig`.

### 3.2 Anatomy of the `.git` Directory
Unlike proprietary centralized systems that require expensive database backends (like SQL Server), Git leverages the raw power of the local Linux filesystem. When you initialize a repository, Git creates a hidden `.git` directory. 
- The `objects/` folder serves as a content-addressable key-value store. Every file, tree, and commit is hashed using SHA-1, ensuring cryptographic integrity. If a single byte is altered maliciously, the hash changes, and Git instantly flags the corruption.
- The `refs/` directory stores lightweight pointers to these cryptographic hashes, enabling developers to branch and merge instantaneously without duplicating megabytes of physical file data.

---

## 4. Part C — The Symbiotic FOSS Ecosystem

Git is not a solitary island; it is an apex orchestrator that relies on a massive foundation of other FOSS projects. 
- **Data Compression:** Git utilizes `zlib` to compress the massive amount of snapshot data stored in the `.git/objects` directory, keeping repository sizes microscopic.
- **Secure Transport:** When executing a `git push` over SSH, Git entirely delegates the cryptographic handshake and tunnel creation to **OpenSSH** (another critical open-source project).
- **The Platform Economy:** Git's open architecture catalyzed the creation of multi-billion-dollar platforms like GitHub, GitLab (open-core), and Bitbucket. Furthermore, Git serves as the structural scaffolding for modern DevOps methodologies like CI/CD (Continuous Integration/Continuous Deployment). Code is no longer just text; a git commit now triggers automated server deployments, Docker container builds, and testing pipelines.

---

## 5. Part D — Paradigm Shift: Open Source vs Proprietary

To truly appreciate Git, we must contrast it with proprietary alternatives like Perforce Helix Core or legacy tools like SVN.

| Metric | Git (GPL v2 Open Source) | Proprietary VCS (e.g., Perforce/SVN) |
|--------|--------------------------|-----------------------------------------|
| **Architecture** | Fully Distributed. Every developer holds a complete backup of the repository's history locally. | Centralized. Developers possess only the current working copy; server outages halt all development. |
| **Financial Cost** | Zero monetary cost. Free to download, modify, and utilize even at massive enterprise scales. | Extremely high per-seat licensing fees, often locking companies into predatory vendor contracts. |
| **Branching Model** | Branches are ultra-lightweight pointers. Creating and merging happens locally in milliseconds. | Branches are heavy operations, often requiring network requests to the central server to copy data. |
| **Code Auditing** | Source code is fully public. Security flaws are quickly identified and patched by thousands of global contributors. | Source code is a black box. Users must rely entirely on the vendor's closed internal QA team. |

While proprietary systems still hold niche dominance (such as managing colossal binary assets in AAA video game development), Git has definitively won the ideological and technical war for source code management. The industry has spoken: decentralized, open protocols are inherently superior to walled gardens.

---

## 6. Part E — Practical Audit: Bash Automation Toolkit

Theory must be accompanied by practical execution. As an aspiring system administrator and software engineer, I developed five custom Bash scripts to automatically audit the Linux environment and verify the integrity of open-source installations. 

These scripts utilize robust POSIX shell mechanics, command substitution, loops, and file parsing techniques.

### Script 1: System Reconnaissance (`script1.sh`)
**Purpose:** Establishes the baseline operating environment. Before auditing software, we must accurately fingerprint the underlying OS kernel, distribution, and user permissions.
**Mechanics:** Uses `uname`, `whoami`, `uptime`, and `lsb_release` aggregated via command substitution.
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
**Purpose:** Programmatically determines if Git is installed using low-level package managers. It ensures dependencies are met and extracts the explicit version.
**Mechanics:** Leverages `dpkg` state checking, if-else conditionals, piping to `grep`, and a `case` statement to print open-source philosophical notes for various packages.
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
**Purpose:** Security is paramount in open-source server environments. This script iterates through core directories to audit cryptographic-like file permissions (e.g., `drwxr-xr-x`) and disk consumption.
**Mechanics:** Employs arrays, `for` loops, `du` for resource calculation, and `awk` for strictly extracting permission strings and ownership metadata from `ls -ld`.
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
**Purpose:** Anomaly detection. System administrators rely on massive log files to determine system health. This script filters out noise to dynamically target faults.
**Mechanics:** Uses command-line positional parameters (`$1`, `$2`), default variable states (`${2:-"error"}`), file size validation, and a stateful `while IFS= read -r LINE` loop to incrementally track pattern matches.
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
**Purpose:** An interactive I/O mechanism that brings the technical audit back to the human element, generating a permanent, personalized text manifesto.
**Mechanics:** Uses `read -p` to capture terminal standard input into variables, string interpolation to construct sentences, and standard output redirection (`>`) to physically write a timestamped `.txt` file to the drive.
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

---

## 7. Conclusion

This Capstone Project demonstrates that the open-source movement is not just an alternative method of software distribution—it is the optimal method. By auditing Git, we have seen how a tool built to escape proprietary captivity has fundamentally reshaped the global software landscape. 

The practical component of this audit proves that managing open-source software requires capable interaction with the Linux command line. Through the automated Bash toolkit developed in Part E, I have successfully demonstrated the ability to programmatically assess system states, evaluate package validity, enforce directory security, map system logs, and securely capture user input. 

Software like Git, licensed under the copyleft protections of the GPL v2, ensures that the foundation of our digital infrastructure remains democratic, auditable, and forever free. We are indeed standing on the shoulders of giants, and it is our technical and ethical responsibility to sustain this ecosystem for the next generation of builders.
