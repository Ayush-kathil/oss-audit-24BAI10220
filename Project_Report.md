:::: titlepage
   

::: center
                        

------------------------------------------------------------------------

\
        **[Capstone Project Report]{style="color: corporateblue"}**\
        **Open Source Software Audit & Technical Review**\
       

------------------------------------------------------------------------

\
                 **Submitted by:**\
        Ayush Gupta\
                         **Academic Details**\
                **Registration Number:** 24BAI10220\
        **Course:** Open Source Software\
        **Subject Audited:** Git (Version Control System)\
                                          **Date:** 2026-03-31\
            
:::
::::

# Executive Summary {#executive-summary .unnumbered}

For my capstone project, I decided to conduct a deep technical and
historical audit of open-source software, using Git as my main focus.
Every computer science student uses version control, but we rarely stop
to think about how it actually works under the hood. Without tools like
Git, managing massive global projects---especially the **LINUX
KERNEL**---would be literally impossible. 

I structured this report into five main areas of research:

-   **History and Licensing:** I looked into the actual reasons Git was
    built (which was surprisingly due to a massive argument in the Linux
    community) and broke down how its GPLv2 license legally protects the
    software.    

-   **System Operations:** I set up a Linux environment to see exactly
    how Git installs, where it hides its database files, and how it
    handles user security.    

-   **Ecosystem Integration:** I explored how Git acts as the middleman
    in modern tech, specifically how it bridges **Python** code and the
    **LINUX KERNEL** to automate software deployments.    

-   **Proprietary Comparison:** To see if open-source is actually
    better, I compared Git head-to-head with Perforce Helix Core, an
    expensive paid alternative.    

-   **Bash Scripting Implementation:** Finally, I wrote five custom
    shell scripts to prove I can manage Linux resources, find Git
    databases, and monitor security logs automatically from the
    terminal.

My main takeaway from this project is that open-source isn't just about
getting software for free; it's about building a safer, more reliable
foundation for the entire tech industry.

------------------------------------------------------------------------

# Part A --- Origin, Architecture, FOSS Philosophy

## A1. The Problem Space and Cryptographic Solution

During my research, what surprised me most was that Git wasn't a planned
academic project. It was a panic response. In the early 2000s, the
**LINUX KERNEL** was getting too big. The tools developers used back
then, like CVS and SVN, were strictly centralized. If you wanted to
commit code, you had to be connected to the internet and talk directly
to one main server. It was a massive bottleneck for global teams.

Linus Torvalds, the creator of Linux, decided to start using a
proprietary tool called BitKeeper because it allowed offline work. The
company behind BitKeeper gave the Linux community a free license.
However, in 2005, a few open-source developers tried to reverse-engineer
BitKeeper. The company got angry and immediately revoked the free
license. Just like that, Linux development came to a screeching halt.
This situation proved exactly why relying on closed-source tools is so
dangerous for open-source communities.

Torvalds ended up locking himself away to write his own tool, which he
named Git. He built it around two core concepts:

1.  **True Decentralization:** When you clone a repository in Git, you
    aren't just downloading the current files; you download the entire
    history. If the central GitHub server goes down, any developer's
    laptop has a full backup of the project.    

2.  **Data Safety:** Git hashes everything using SHA-1. This means if a
    file gets corrupted on your hard drive, or if someone tries to
    secretly inject bad code, the hash will change and Git will throw an
    error immediately. 

## A2. Legal Mechanics of the GPLv2 License

Git is protected by the GNU General Public License version 2 (GPLv2). I
read through the license to understand how it works, and it's basically
a \"copyleft\" agreement.

The GPLv2 gives us four specific freedoms:

-   We can run the program for whatever reason we want.    

-   We can open up the source code, study it, and change it.    

-   We are allowed to share copies with our friends or coworkers.    

-   We can publish our modified versions to the public.

But there is a major catch that makes GPLv2 so powerful. If a big tech
company takes Git, modifies the code to make it faster, and tries to
sell it, they are legally forced to release their new code under the
same GPLv2 license. They can't keep their improvements a secret. 

This is completely different from something like the MIT license, where
you can take the code, change it, and sell it as a closed product.
Torvalds picked GPLv2 specifically so that no corporation could ever
hold Git hostage again.

## A3. The Ethics of Open Source in the Enterprise

In our classes, we often debate if it's fair that huge companies make
billions of dollars off free software. Today, almost every major company
runs their servers on the **LINUX KERNEL**, writes their apps in
**Python**, and tracks all their changes using **Git**. 

At first glance, it looks like corporate exploitation. But the reality I
found is that it's a mutual relationship. These massive companies are
actually the ones funding open-source. They hire thousands of developers
and pay them six-figure salaries just to fix bugs and write new features
for Linux and Git. 

The coolest part about the open-source model is how it prevents us from
wasting time. If I want to build a new startup, I don't have to write my
own programming language or operating system. I can just grab Python,
Linux, and Git for free, and focus 100% of my energy on writing my
actual app. 

# Part B --- Linux Footprint & Systems Architecture

To truly understand how Git operates, I decided to audit its behavior
natively on a Debian 12 Linux machine.

## B1. Package Installation

One of the best things about Git is that you don't need to manually
compile it from source code. Linux package managers handle everything,
making it super easy to deploy on a server. I ran the following commands
to install it:

``` {caption="Standard Git Installation on Debian"}
# Update the local package list
sudo apt-get update

# Install git directly from the repository
sudo apt-get install git -y
```

While researching, I noticed that Git heavily depends on a few other C
libraries.

## B2. Where the Files Go (.git)

Most databases run in the background as a service, but Git is completely
different. It only executes when you type a command. When you run
`git init` in a folder, it creates a hidden directory called `.git`.
That single folder is the entire database.

If you look inside the `.git` folder, you'll find:

-   `objects/`: This folder holds all your actual code, compressed into
    secure little blobs.    

-   `refs/`: This is where Git stores simple text files that point to
    your branches.    

-   `HEAD`: A file that keeps track of which branch you are currently
    working on.    

-   `config`: The configuration settings specifically for your current
    project.

## B3. Security Features

From a security standpoint, Git is very safe to run on a Linux server.
It runs strictly under your standard user account. It never asks for
\"root\" privileges. This means if someone finds a vulnerability in Git,
the hacker can only access your personal project files; they can't break
into the server's main password files like `/etc/shadow`. Also, Git
doesn't handle its own network security; it relies entirely on OpenSSH
when you communicate with remote servers.

# Part C --- The FOSS Ecosystem Integration

Git doesn't exist in a vacuum. In the real world, it's the glue that
connects different technologies together, especially when it comes to
automation.

## C1. Connecting Python and Linux

To see how this works in practice, think about a standard web project. A
developer writes the backend code using **Python** and saves their
progress with **Git**. When they are finished, they push that code to
the company's main Linux server.

Because of how Git works, you can set up a \"hook\" (a script) that runs
the moment the server receives the new code. That script can tell the
**LINUX KERNEL** to spin up a testing environment and run a bunch of
Python test scripts. If the Python code works perfectly, Git pushes the
live website to the public. It completely automates the deployment
process.

## C2. How Git is Updated

Even though Git is the most popular developer tool on the planet, the
way they update it is surprisingly old-fashioned. You can't just go to a
website and click \"Pull Request\" to add code to Git. If you want to
contribute, you have to write your C code, convert it into a text patch,
and email it to the official Git mailing list. The core maintainers will
then reply to your email with critiques. It's a very slow process, but
it guarantees that only the most heavily scrutinized, high-quality code
makes it into the official software.

# Part D --- Open Source vs Proprietary 

For my critical analysis, I decided to compare Git against Perforce
Helix Core, which is a very expensive, proprietary version control
system used a lot in the video game industry.

  ---------------------- --------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------
  **Feature**            **Git (Open Source)**                                                             **Perforce (Paid)**
    **Setup**            Decentralized. Every developer has a full backup on their machine.                Centralized. You have to be connected to the main server to get any work done.
    **Cost**             100% free. You can scale to 10,000 developers without paying a dime.              Very expensive. You pay a high licensing fee for every single user on your team.
    **Security Check**   Completely open. Anyone in the world can check the code for vulnerabilities.      Closed source. You have to blindly trust that their internal team wrote secure code.
    **Handling Files**   Amazing for text and code, but struggles a bit if you have massive video files.   Specifically designed to handle massive, gigabyte-sized binary art files easily.
    **Data Lock-in**     None. It's very easy to pull your code out of Git if you want to switch tools.    High risk. Once you commit to Perforce, moving your history to another tool is difficult.
                                                                                                           
  ---------------------- --------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------

  : Comparing Git and Perforce

## Final Verdict

After looking at the data, Git is clearly the better choice for almost
every software engineering project out there---whether you're making
websites, writing Python scripts, or managing Linux servers. It's free,
it's safer because the community can audit it, and you don't get stuck
if your internet goes down. The only time I would ever recommend
Perforce is if I was working at a game studio that needed to manage
thousands of massive 3D models.

# Part E --- Shell Script Implementation

To prove that I can practically manage these open-source tools on a
server, I wrote five Bash scripts. These scripts automate checking
system health, finding Git databases, and monitoring security logs.

## Script 1: System Check

Before running any audits, you need to know what kind of machine you are
on. This script checks the Linux kernel version, the OS name, and how
much RAM is currently free.

``` {caption="sys\\_check.sh"}
#!/bin/bash
# Checks OS and RAM info on the machine

echo "Starting system check..."
echo "------------------------"

KERNEL=$(uname -r)
echo "Kernel: $KERNEL"

OS=$(cat /etc/os-release | grep '^PRETTY_NAME' | cut -d '=' -f 2 | tr -d '"')
echo "OS: $OS"

RAM=$(free -m | awk 'NR==2{print "Used: "$3"MB, Free: "$4"MB"}')
echo "Memory: $RAM"

echo "Check complete."
```

**Example Output:**

    Starting system check...
    ------------------------
    Kernel: 6.1.0-18-amd64
    OS: Debian GNU/Linux 12 (bookworm)
    Memory: Used: 3241MB, Free: 8520MB
    Check complete.

## Script 2: Git Folder Finder

This script looks at your current directory to see if it is a Git
repository. If it is, it counts exactly how many files are saved inside
the hidden database.

``` {caption="git\\_finder.sh"}
#!/bin/bash
# Finds the .git directory and counts objects

DIR=${1:-.}

if [ ! -d "$DIR/.git" ]; then
    echo "Error: No .git folder found here."
    exit 1
fi

echo "Git database found."
COUNT=$(find "$DIR/.git/objects" -type f | wc -l)
echo "Total saved items in objects folder: $COUNT"

SIZE=$(du -sh "$DIR/.git" | awk '{print $1}')
echo "Total size of .git folder: $SIZE"
```

**Example Output:**

    Git database found.
    Total saved items in objects folder: 421
    Total size of .git folder: 12M

## Script 3: Permissions Checker

File permissions are a huge deal in Linux. This script checks a few
important system files to make sure they aren't accidentally left wide
open for anyone to edit.

``` {caption="perm\\_check.sh"}
#!/bin/bash
# Checks permissions of important security files

echo "Checking file permissions..."
FILES=("/etc/shadow" "/usr/bin/git" "/var/log/auth.log")

for file in "${FILES[@]}"; do
    if [ -e "$file" ]; then
        PERM=$(stat -c "%a" "$file")
        OWNER=$(stat -c "%U" "$file")
        echo "$file -> Owner: $OWNER, Permissions: $PERM"
    else
        echo "$file -> File missing!"
    fi
done
```

**Example Output:**

    Checking file permissions...
    /etc/shadow -> Owner: root, Permissions: 640
    /usr/bin/git -> Owner: root, Permissions: 755
    /var/log/auth.log -> Owner: root, Permissions: 640

## Script 4: Log Reader

This script reads the Linux security logs to count how many times
someone failed to log in. This is a great way to spot if a hacker is
trying to brute-force their way into the server.

``` {caption="log\\_reader.sh"}
#!/bin/bash
# Counts failed login attempts in the logs

LOG="/var/log/auth.log"

if [ ! -r "$LOG" ]; then
    echo "Need sudo to read the log file."
    exit 1
fi

FAILS=$(grep -c "Failed password" "$LOG")
echo "Found $FAILS failed login attempts."
```

**Example Output: Found 14 failed login attempts**

## Script 5: Git Security Hook

This script automates a bit of security. It creates a Git \"pre-commit\"
hook that will physically stop a developer from saving their code if
they accidentally type the word \"PASSWORD\" into their files.

``` {caption="make\\_hook.sh"}
#!/bin/bash
# Makes a simple Git hook to block passwords

if [ ! -d ".git/hooks" ]; then
    echo "Run this inside a Git folder."
    exit 1
fi

HOOK=".git/hooks/pre-commit"

cat << 'EOF' > "$HOOK"
#!/bin/bash
if git diff --cached | grep -i "PASSWORD"; then
    echo "Error: You left a password in your code!"
    exit 1
fi
EOF

chmod +x "$HOOK"
echo "Security hook created successfully."
```

**Example Output:**

    Security hook created successfully.

# Part F --- Conclusion

Doing this capstone project completely changed how I look at the
software I use every day. Open-source isn't just a charity project where
people give away free code; it's the actual foundation of the modern
internet. Git's decentralized design solved one of the hardest problems
in computer science: how to let thousands of people edit the exact same
files at the same time without ruining each other's work or relying on a
single expensive server. 

Because of the GPLv2 license, we know that Git will always belong to the
community. The bash scripts I wrote also showed me how easy it is to
inspect and automate these tools right from the Linux terminal.
Ultimately, open-source is the safest, most efficient way to build
technology, and this audit proved exactly why almost every major company
relies on it today.

# References

1.  **Torvalds, L., & Hamano, J. C.** (2005-Present). *Git
    Documentation.* Retrieved from <https://git-scm.com/doc>    

2.  **Free Software Foundation.** (1991). *GNU General Public License,
    version 2.* Retrieved from
    <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>    

3.  **Linux Foundation.** (n.d.). *The Linux Kernel Archives.*    

4.  **Chacon, S., & Straub, B.** (2014). *Pro Git (2nd Edition).*
    Apress.    

5.  **Filesystem Hierarchy Standard Group.** (n.d.). *Linux Filesystem
    Hierarchy Standard.*
