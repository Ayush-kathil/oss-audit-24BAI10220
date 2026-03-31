# 🚀 Open Source Software Audit & Bash Automation Toolkit

## 📌 Project Overview
This repository contains a technical and philosophical audit of **Git**, serving as a comprehensive exploration of open-source principles, licensing, and system-level operations. It bridges theoretical open-source concepts with practical Linux environment management through a series of automated Bash scripts.

**Student Name:** Ayush Gupta  
**Registration Number:** 24BAI10220  
**Course:** Open Source Software  
**Software Audited:** Git (Version Control System)  
**License:** GNU General Public License v2 (GPL v2)  

---

## 🛠️ Repository Organization
A professional, structured approach separating scripts, documentation, and execution proofs.

```text
oss-audit-24BAI10220/
├── README.md                              # Configuration and run instructions (this file)
├── Project_Report.md                      # Comprehensive analysis of OSS principles & Git
├── manifesto_ayush_gupta.txt              # Generated user commitment to OSS
├── Scripts/                               # Executable Linux Bash utilities
│   ├── script1.sh              
│   ├── script2.sh
│   ├── script3.sh
│   ├── script4.sh
│   └── script5.sh
└── screenshots/                           # Proof of execution for each script
    ├── script1.png
    ├── script2.jpg
    ├── script3.png
    ├── script4.png
    └── script5.jpg
```

---

## ⚙️ Setup & Configuration
Follow these steps to set up the environment and run the project safely.

### 1. Environment Requirements
This toolkit is engineered for **Linux** environments (Ubuntu, Debian, Fedora, or WSL). Ensure you have standard GNU core utilities installed.

**Ubuntu / Debian:**
```bash
sudo apt update && sudo apt install git -y
```

**RHEL / CentOS / Fedora:**
```bash
sudo yum install git -y   # CentOS/RHEL
sudo dnf install git -y   # Fedora
```

### 2. Required Dependencies
| Tool | Purpose | Install (Ubuntu/Debian) |
|------|---------|-----------------|
| `bash` | Core script interpreter | Pre-installed |
| `git` | The chosen audited software | `sudo apt install git` |
| `coreutils` | `du`, `ls`, `date`, `uname`, `whoami` | Pre-installed |
| `grep` / `awk`| Text search and field extraction | Pre-installed |
| `dpkg` | Package state inspection | Pre-installed |

### 3. Cloning & Permissions
Before running the toolkit, you must clone the repository and grant execution permissions to the `Scripts/` directory.

```bash
git clone https://github.com/Ayush-kathil/oss-audit-24BAI10220.git
cd oss-audit-24BAI10220

# Make all scripts executable 
chmod +x Scripts/*.sh
```

---

## 💻 Script Execution & Analysis

Each script demonstrates specific Linux command-line capabilities and Bash automation mechanics.

### 1️⃣ System Reconnaissance (`script1.sh`)
**Purpose:** Acts as a system fingerprinting tool. Makes system calls to fetch the Linux kernel version, distribution release data, hostname, uptime, and current user metrics.  
**Demonstrates:** Command substitution `$()`, environment variables, and `echo` formatting.  
**Execution:**
```bash
./Scripts/script1.sh
```
📸 **Output Proof:** [View Screenshot](screenshots/script1.png)

### 2️⃣ FOSS Package Inspector (`script2.sh`)
**Purpose:** Uses package manager commands (`dpkg`) to formally verify the installation of Git on the host machine. Automatically extracts version numbers and integrates a philosophical assessment based on the package.  
**Demonstrates:** If-then-else conditionals, `case` statements, package querying (`dpkg`), and piping/filtering.  
**Execution:**
```bash
./Scripts/script2.sh
```
📸 **Output Proof:** [View Screenshot](screenshots/script2.jpg)

### 3️⃣ Security & Resource Auditor (`script3.sh`)
**Purpose:** Iterates through critical Linux system layers (`/etc`, `/var/log`, `/home`) reading file permission strings, owner metadata, and disk usage metrics via `du`. Validates that Git repository directories are logically sound.  
**Demonstrates:** Arrays, `for` loops, `ls -ld`, and string extraction via `awk`.  
**Execution:**
```bash
./Scripts/script3.sh
```
📸 **Output Proof:** [View Screenshot](screenshots/script3.png)

### 4️⃣ Automated Log Parsing (`script4.sh`)
**Purpose:** Scans deep into provided system log files, parsing lines dynamically to find critical keywords ("error" or "failed"). It demonstrates how system administrators actively handle log anomalies.  
**Demonstrates:** While-read loops, positional command-line arguments (`$1`, `$2`), stateful variables/counters, and file checking.  
**Execution:**
*Note: This script requires a log file path as its first argument.*
```bash
# Default keyword 'error'
./Scripts/script4.sh /var/log/syslog

# Custom argument 'failed'
./Scripts/script4.sh /var/log/syslog "failed"
```
📸 **Output Proof:** [View Screenshot](screenshots/script4.png)

### 5️⃣ The OSS Philosophy Generator (`script5.sh`)
**Purpose:** An interactive, stateful I/O script prompting the user for their thoughts on open source. Captures answers and writes them into a formalized, timestamped text file `manifesto_<username>.txt`.  
**Demonstrates:** Standard input `read`, string interpolation, and standard output redirection (`>`, `>>`) for permanent file writing.  
**Execution:**
```bash
./Scripts/script5.sh
```
📸 **Output Proof:** [View Screenshot](screenshots/script5.jpg)

---

## 📝 Notes for Evaluators
- All Bash scripts conform strictly to POSIX principles and were tested on a modern Linux environment.
- No `sudo` or root privileges are required to run any script (some restrictive paths in script 3 will safely pass by without crashing).
- The detailed written assessment of the open-source philosophy, licensing (GPL v2), and technical analysis mapping can be found entirely inside [Project_Report.md](Project_Report.md).

---
**License**: Submitted as coursework for the Open Source Software Audit. Code constitutes original student work by Ayush Gupta.
