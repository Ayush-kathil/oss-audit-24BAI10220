# 🚀 Open Source Software Audit: Unpacking Git

![Bash Scripting](https://img.shields.io/badge/Language-Bash_Scripting-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Platform Linux](https://img.shields.io/badge/Platform-Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![License GPLv2](https://img.shields.io/badge/License-GPL_v2-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Project_Status-Active-success?style=for-the-badge)

A comprehensive analytical report and interactive Bash toolkit designed to explore the architecture, licensing, and system-level operations of **Git** within a Linux ecosystem.

---

## 👨‍💻 Author Information
- **Name:** Ayush Gupta
- **Registration Number:** 24BAI10220
- **Course:** Open Source Software
- **Deliverable:** Capstone Project (Open Source Audit)

---

## 📖 Project Overview & Philosophy

The open-source ecosystem thrives on transparency, community collaboration, and robust tooling. This project serves as a technical and philosophical audit of **Git**—the undisputed backbone of modern version control. 

Rather than just summarizing what Git does, this project bridges the gap between **theory** (licensing, ethics, and community impact) and **practice** (interacting with the Linux environment via shell scripting to monitor system health, packages, and permissions).

### 🎯 Core Objectives:
1. **Analyze** the origin, GPL v2 licensing model, and ethical foundations of Git.
2. **Demonstrate** practical Linux environment management using automated Bash scripts.
3. **Compare** distributed version control (Git) against proprietary, centralized models.

---

## 🧠 Why Git? (The Chosen Software)

Created by Linus Torvalds in 2005 to manage the massive Linux kernel project, Git revolutionized software development. 
* **Distributed Architecture:** Unlike SVN, every developer has a full backup of the repository history.
* **Performance:** Optimized for branching and merging, treating data like a stream of snapshots.
* **Open Source Impact:** Git powers platforms like GitHub and GitLab, serving as the foundational layer for global open-source contributions.

---

## 💻 Technical Architecture: Understanding the Scripts

The practical component of this audit consists of five Bash scripts. Here is an explanation of what each script is actually doing under the hood:

### 1️⃣ `script1.sh` | System Reconnaissance
* **What it does:** Acts as a system fingerprinting tool. It makes system calls to fetch the Linux kernel version, distribution release data, and current user metrics.
* **Why it matters:** In an open-source audit, knowing the exact environment you are operating in is crucial for reproducibility and debugging.

### 2️⃣ `script2.sh` | FOSS Package Inspector
* **What it does:** Uses conditional logic (`if/else`) and package manager commands to hunt for the Git binary. It extracts the version and verifies its installation path.
* **Why it matters:** Automates dependency checking. Before auditing a software, you must mathematically verify its presence and state on the host machine.

### 3️⃣ `script3.sh` | Security & Resource Auditor
* **What it does:** Iterates through specific directories using `for` loops to read file permission strings (e.g., `rwxr-xr-x`), owner data, and disk usage (`du`).
* **Why it matters:** Git repositories manage source code. Understanding directory permissions is vital to ensure that open-source code is secure from unauthorized local modifications.

### 4️⃣ `script4.sh` | Automated Log Parsing
* **What it does:** Uses tools like `grep` and `awk` to scan deep into `/var/log/syslog` or `/var/log/messages`, filtering out the noise to find critical keywords like "error" or "failed".
* **Why it matters:** System administrators rely on logs to maintain health. This script demonstrates how open-source OS environments handle error tracking.

### 5️⃣ `script5.sh` | The OSS Philosophy Generator
* **What it does:** An interactive I/O script. It prompts the user for their thoughts on open source, captures the variables, and writes them permanently into a text file (`manifesto_ayush_gupta.txt`).
* **Why it matters:** Highlights the human element of FOSS (Free and Open Source Software), allowing developers to document their personal commitment to the community.

---

## ⚙️ Execution Guide

### Prerequisites
- A Linux environment (Ubuntu, Debian, Fedora, or WSL).
- `git` and standard GNU core utilities installed.

### Step-by-Step Setup
**1. Clone the environment:**
```bash
git clone [https://github.com/Ayush-kathil/oss-audit-24BAI10220.git](https://github.com/Ayush-kathil/oss-audit-24BAI10220.git)
cd oss-audit-24BAI10220
