# Capstone Project Report

## Open Source Software Audit & Technical Review

**Submitted by:** Ayush Gupta  
**Registration Number:** 24BAI10220  
**Course:** Open Source Software  
**Subject Audited:** Git (Version Control System)  
**Date:** 31 March 2026

---

## Executive Summary

This report presents a technical and ecosystem-level audit of **Git** as open-source software. The study examines why Git was created, how its architecture works, how GPLv2 licensing protects software freedom, and how Git integrates with Linux and Python-based workflows. A comparative review with Perforce Helix Core is included to evaluate open-source versus proprietary trade-offs.

The project also includes five Bash scripts (in `Scripts/`) to demonstrate practical Linux-side auditing, package inspection, directory and permission checks, log analysis, and open-source manifesto generation.

**Key takeaway:** Git is not only a free tool; it is foundational infrastructure for resilient, collaborative, and auditable software development.

---

## Part A: Origin, Architecture, and FOSS Philosophy

### A1. Problem Space and Technical Design

Git was created in 2005 after the Linux community lost free access to BitKeeper. At that point, Linux kernel development needed a system that could scale globally, allow offline development, and protect history integrity.

Git addressed this with two core design choices:

1. **Distributed model:** every clone contains full repository history.
2. **Content integrity:** Git hashes stored objects, making tampering or corruption detectable.

### A2. GPLv2 Legal Mechanics

Git is licensed under **GNU GPLv2**, which grants users the right to:

- run the software for any purpose,
- study and modify source code,
- redistribute copies,
- share modified versions.

The key requirement is copyleft continuity: redistributed modified versions must remain under GPLv2. This prevents private lock-in of community improvements.

### A3. Open-Source Ethics in Enterprise Use

Modern companies rely heavily on Linux, Git, and open-source language ecosystems such as Python. While commercial value is built on top of these tools, large organizations also contribute through paid development, maintenance, and security hardening. In practice, this creates a feedback cycle where industry and community both benefit.

---

## Part B: Linux Footprint and System Behavior

The audit was performed from a Debian-based Linux workflow.

### B1. Installation

```bash
sudo apt-get update
sudo apt-get install git -y
```

### B2. Repository Internals (`.git`)

Git stores project history locally inside `.git/`, including:

- `objects/` for compressed content objects,
- `refs/` for branch and tag pointers,
- `HEAD` for active branch reference,
- `config` for repository-level settings.

### B3. Security Characteristics

Git typically runs with user-level permissions and does not require root access for standard workflows. For remote communication, it commonly relies on transport layers such as SSH, separating version-control logic from network authentication responsibilities.

---

## Part C: Ecosystem Integration

### C1. Git + Python + Linux in Delivery Pipelines

In common CI/CD setups:

1. Developers version Python services in Git.
2. Code is pushed to a remote repository.
3. Server hooks or pipeline runners trigger tests and deployment steps.
4. Linux hosts execute the automation workflow.

This positions Git as the control layer for traceable, repeatable release pipelines.

### C2. Upstream Contribution Model

Git’s own project governance is conservative and quality-focused. Core changes are reviewed through mailing-list based patch discussions and maintainer feedback cycles before inclusion.

---

## Part D: Open Source vs Proprietary Comparison

### Git vs Perforce Helix Core

| Feature | Git (Open Source) | Perforce (Proprietary) |
|---|---|---|
| Architecture | Distributed; each developer has full history | Centralized; heavy dependence on central server |
| Cost Model | Free to use and scale | License-based, user-cost scaling |
| Transparency | Source-visible and community-auditable | Closed internal implementation |
| Strengths | Excellent for source-code collaboration | Strong handling of very large binary assets |
| Lock-in Risk | Lower migration barriers | Higher switching cost in many deployments |

### Verdict

For most software engineering workflows, Git provides stronger flexibility, transparency, and cost efficiency. Proprietary alternatives can be better suited in specialized pipelines (for example, very large binary asset management in game production).

---

## Part E: Shell Script Implementation

Five Bash scripts were developed and stored in the `Scripts/` folder.

### E1. Script 1 — System Identity Report (`Scripts/script1.sh`)

Purpose: prints distribution, kernel, user, uptime, and license note.

### E2. Script 2 — FOSS Package Inspector (`Scripts/script2.sh`)

Purpose: verifies whether Git is installed, extracts version details, and prints package metadata/philosophy notes.

### E3. Script 3 — Disk and Permission Auditor (`Scripts/script3.sh`)

Purpose: inspects selected directories for ownership, permission bits, and storage footprint; checks user Git config presence.

### E4. Script 4 — Log File Analyzer (`Scripts/script4.sh`)

Purpose: scans a target log file for keyword frequency and shows recent matching lines.

### E5. Script 5 — Open Source Manifesto Generator (`Scripts/script5.sh`)

Purpose: collects user input and generates a personalized open-source manifesto text file.

---

## Conclusion

This audit demonstrates that Git is both a technical system and a governance model for collaborative engineering. Its distributed architecture improves resilience, its open development model improves trust, and its licensing structure preserves long-term software freedom.

The practical scripting component confirms that open-source tooling can be operationalized directly from the Linux terminal for inspection, automation, and repeatable administration tasks.

---

## References

1. Torvalds, L., & Hamano, J. C. *Git Documentation*. https://git-scm.com/doc
2. Free Software Foundation. *GNU General Public License v2.0*. https://www.gnu.org/licenses/old-licenses/gpl-2.0.html
3. Linux Foundation. *The Linux Kernel Archives*. https://www.kernel.org/
4. Chacon, S., & Straub, B. *Pro Git* (2nd Edition). Apress.
5. Filesystem Hierarchy Standard Group. *Filesystem Hierarchy Standard*.
