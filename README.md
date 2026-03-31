# Open Source Software Audit & Bash Automation Toolkit

## 📌 Project Overview
This repository contains a technical and philosophical audit of **Git**, serving as a comprehensive exploration of open-source principles, licensing, and system-level operations. It bridges theoretical open-source concepts with practical Linux environment management through a series of automated Bash scripts.

**Author:** Ayush Gupta  
**Registration Number:** 24BAI10220  
**Course:** Open Source Software  
**Deliverable:** Capstone Project (Open Source Audit)

---

## 🛠️ Repository Structure
```text
oss-audit-24BAI10220/
├── README.md                 # You are here
├── Project_Report.md         # Comprehensive analysis of OSS principles & Git
├── manifesto_ayush_gupta.txt # Generated user commitment to OSS
└── Scripts/
    ├── script1.sh            # System Identity Report
    ├── script2.sh            # FOSS Package Inspector
    ├── script3.sh            # Disk and Permission Auditor
    ├── script4.sh            # Log File Analyzer
    └── script5.sh            # Open Source Manifesto Generator
```

## ⚙️ Execution Guide & Script Analysis

This toolkit consists of five Bash scripts designed to monitor system health, inspect packages, and parse system logs. 

### Prerequisites
- A Linux-based environment (Ubuntu, Debian, Fedora, or WSL).
- Standard GNU core utilities.
- Execute permissions on the scripts.

To make all scripts executable at once, run:
```bash
chmod +x Scripts/*.sh
```

---

### 1️⃣ System Reconnaissance (`script1.sh`)
Acts as a system fingerprinting tool. It makes system calls to fetch the Linux kernel version, distribution release data, hostname, uptime, and current user metrics. This is crucial for establishing the base environment parameters.

**Execution Command:**
```bash
./Scripts/script1.sh
```

### 2️⃣ FOSS Package Inspector (`script2.sh`)
Uses package manager commands (`dpkg`) to verify the installation of Git on the host machine. It automatically extracts the version number, installation status, and provides a philosophical note on the importance of the package.

**Execution Command:**
```bash
./Scripts/script2.sh
```

### 3️⃣ Security & Resource Auditor (`script3.sh`)
Iterates through critical Linux directories (like `/etc`, `/var/log`, `/home`) to read file permission strings, owner data, and disk usage metrics. It effectively audits directory permissions to ensure that the environment is structurally sound.

**Execution Command:**
```bash
./Scripts/script3.sh
```

### 4️⃣ Automated Log Parsing (`script4.sh`)
Scans deep into provided system log files, filtering out the noise to find critical keywords (like "error" or "failed"). It demonstrates how administrators handle system-level error tracking in an open-source OS.

**Execution Command:**
*Note: You must provide a log file as an argument. A keyword is optional (defaults to "error").*
```bash
./Scripts/script4.sh /var/log/syslog
# OR with a custom keyword:
./Scripts/script4.sh /var/log/syslog "failed"
```

### 5️⃣ The OSS Philosophy Generator (`script5.sh`)
An interactive I/O script that prompts the user for their thoughts on open source. It captures the answers and outputs them into a formalized, timestamped text file, generating a persistent `manifesto_<username>.txt`.

**Execution Command:**
```bash
./Scripts/script5.sh
```

---

## ⚖️ The Chosen Software: Git (GPL v2)
Git, created by Linus Torvalds, is the distributed version control system that acts as the bedrock of modern open-source collaboration. Unlike decentralized models, it provides high performance, complete local history, and data integrity. Distributed under the GNU General Public License v2 (GPLv2), it embodies the core freedoms of open-source software—allowing developers to freely study, modify, and distribute the source code.
