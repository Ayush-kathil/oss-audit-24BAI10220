# Open Source Software Audit: Capstone Project Report

## 1. Introduction
This report serves as the documentary component of the Open Source Software (OSS) Audit capstone project. The objective of this project is to evaluate an open-source software tool—Git—while simultaneously demonstrating practical system administration capabilities using Bash shell scripting in a Linux environment. The project bridges the ideological principles of the Free and Open Source Software (FOSS) movement with the technical execution required to maintain an open-source ecosystem.

**Student:** Ayush Gupta  
**Registration Number:** 24BAI10220  
**Software Audited:** Git  

## 2. Software Selection: Git
Git was chosen for this audit because it is the fundamental infrastructure layer for the entire modern open-source movement. Created in 2005 by Linus Torvalds to manage the Linux Kernel, Git replaced proprietary and centralized version control systems (like BitKeeper and SVN).

### 2.1 Licensing Model
Git is distributed under the **GNU General Public License version 2 (GPLv2)**. This constitutes a strong copyleft license that guarantees end users the freedom to run, study, share, and modify the software. Importantly, the GPLv2 ensures that any derivative works or modifications distributed by users must also be licensed under the GPLv2, preventing the software from being enclosed into proprietary silos.

### 2.2 Difference Between Open Source and Proprietary Version Control
Unlike proprietary, centralized version control architectures, Git is fundamentally **distributed**. 
- **Proprietary/Centralized:** Developers must constantly authenticate with a central server to commit changes or view history. If the central server goes down, work is paralyzed.
- **Git (Open Source/Distributed):** Every developer clones the entire repository to their local machine. This repository includes the complete history and version tracking. This architecture not only makes operations exponentially faster (as they are local) but also democratizes data ownership, making the project highly resilient against server failures or corporate censorship.

## 3. Script Analysis and System Automation
As part of the technical audit, five Bash scripts were developed to interact with the underlying Linux operating system, showcasing automated data extraction, package management, and system auditing.

### 3.1 Script 1: System Identity Report (`script1.sh`)
**Purpose:** Establishes the baseline operating environment. 
**Mechanism:** Uses standard Linux commands (`uname`, `uptime`, `whoami`, `lsb_release`) to aggregate kernel version, distribution details, and system uptime. Without understanding the base environment, auditing software is impossible.

### 3.2 Script 2: FOSS Package Inspector (`script2.sh`)
**Purpose:** Verifies the installation and metadata of the audited software (Git).
**Mechanism:** Utilizes `dpkg` to confirm that the package is present on the Debian/Ubuntu-based machine. It parses the output to isolate the version, priority, and installation status, ensuring the software dependencies are correctly configured.

### 3.3 Script 3: Disk and Permission Auditor (`script3.sh`)
**Purpose:** Audits the structural integrity and security of key system directories.
**Mechanism:** Employs `loops`, `ls -ld`, and `awk` to extract cryptographic-like read/write/execute permissions (e.g., `drwxr-xr-x`), owner, group, and disk usage (`du`) for critical paths like `/etc` and `/var/log`. This script verifies that open-source configurations are safely permissioned.

### 3.4 Script 4: Log File Analyzer (`script4.sh`)
**Purpose:** Automates error detection to maintain system health.
**Mechanism:** Takes positional arguments from the user to search a specified log file (e.g., `/var/log/syslog`) for a given string (defaulting to "error"). Utilizing `while` loops and `grep`, it calculates the frequency of anomalies, acting as a lightweight intrusion or crash detection mechanism.

### 3.5 Script 5: Open Source Manifesto Generator (`script5.sh`)
**Purpose:** Connects the technical implementation back to human open-source ideology.
**Mechanism:** An interactive script leveraging `read` to pull user input from the terminal directly. It parses this data and redirects out streams to programmatically generate a personalized, timestamped `.txt` manifesto emphasizing open-source freedoms.

## 4. Open Source Philosophy and "Standing on the Shoulders of Giants"
The phrase "standing on the shoulders of giants" perfectly captures the essence of open source. Modern developers do not need to invent a new version control system from scratch to build a revolutionary app; they simply use Git. They don't need to write a new compiler; they use GCC. By releasing software freely, earlier developers become the "giants" that allow the current generation of engineers to see further and build faster. Git itself is built upon the philosophies and collaborative culture fostered by the Linux community. Open source is arguably humanity's most successful collaborative intellectual project.

## 5. Conclusion
This capstone project effectively illustrates that open source is a combination of both software architecture and ethical licensing. By automating Linux administration tasks through Bash scripting, this audit demonstrates a hands-on understanding of the environment necessary to sustain software like Git.
