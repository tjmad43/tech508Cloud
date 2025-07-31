# Linux

- [Linux](#linux)
  - [Why learn Linux?](#why-learn-linux)
  - [What is Linux?](#what-is-linux)
  - [What is Bash?](#what-is-bash)
  - [Commands](#commands)
  - [More commands: install packages](#more-commands-install-packages)
  - [Permissions \& sudo](#permissions--sudo)
  - [Bash Scripting](#bash-scripting)
    - [basic steps to provision](#basic-steps-to-provision)
    - [basic script to install something:](#basic-script-to-install-something)
    - [Run bash script](#run-bash-script)
  - [Environment variables](#environment-variables)
  - [Processes](#processes)
    - [What is a process?](#what-is-a-process)
    - [What are the two types of processes?](#what-are-the-two-types-of-processes)
    - [Background processes](#background-processes)
    - [Kill processes](#kill-processes)
  - [Timeout issue](#timeout-issue)


## Why learn Linux?
- open-source
- many different distributions (flavours)
- fast-growing
- inexpensive
- stable (compared to Windows)
- scales well
- also can be used as a desktop/workstation for everyday use
- often used to deploy applications
- more employable with Linux experience

## What is Linux?
- spinoff of Unix
- made up of a kernel (core OS) plus many libraries and utilities/tools that rely on it
  
## What is Bash?
- type of shell
  - shell is software/interface that runs commands (AKA a command line interpreter)
- stands for Bourne Again Shell
- range of shells, the most common default is Bash
  - /bin/bash
  - first / refers to top of directory, like C:/ in Windows
  

## Commands

- history of commands: `history`
  - `history -c ` to clear
  - `!number` of command to run that command 
- list files: `ls` 
  - including hidden files: `ls -a` 
  - long format, more file info: `ls -la` 
- download file: `curl URL` `--output filename.extension` to give it a place to go
  - `wget URL -O filename.extension` also works

- rename file: `mv filename newfilename`
- copy file: `cp filename copyfilename`
- delete file: `rm filename`
- make folder: `mkdir foldername`
  - if you use space between words in the folder name, it will create separate folders for them - acceptss multiple arguments
- remove empty directory: `rm -d foldername`
- remove directory: `rm -r foldername`
- help: `[command] --help` or `man [command]`
- make empty file: `touch filename`
- view file info: `cat filename`
- edit file: `nano filename`
- to read a given amount of lines from start of file: `head -[number] filename`
- from bottom of file: `tail -[number] filename`
- to see line numbers: `nl filename`
- search for word in a file: `cat filename | grep word`
  - `|` takes output of first command and feeds into next
- move a file: `mv` (same as renaming)
  - e.g. `mv chicken-joke.txt funny-stuff/`
  - to move back: `mv chicken-joke.txt ~/`
  - or to directory you're in: `mv funny-stuff/chicken-joke.txt .`
  - to move up a directory: `mv bad-joke.txt ..`
- to exit vm: `exit`
- **note:** use control not command
- **note:** Linux is case sensitive


## More commands: install packages

- `apt install []`
  - will deny permission if not root user
- `sudo apt install []`
  - sudo meaning "super user do" - temporary root privelidges
- BUT, it's still not working, unable to locate packages tree
  - sources list has to be updates first
- run `sudo apt update -y`
  - `-y` to automatically say yes
- tree package installed, can now run `tree` command to see files more clearly
- now run `sudo apt upgrade` 
  - more dangerous than update
  - do not run on a production machine without testing first
  - `sudo systemctl status []` to check status of services


## Permissions & sudo

- **note:** / means root directory
  - ~ is home/user directory, not root
- some folders in / are only accessible as root
  - `sudo su` to run multiple commands (including `cd` as root)
  - `exit` when done



## Bash Scripting

- `nano filename.sh` to create file

- `#!bin/bash` at the top of every bash script to tell it what interpreter to use

### basic steps to provision
- update
- upgrade
- install
- configure
- restart - to restart the process
- enable - add to startup menu

**note:** don't put commands into a script that haven't been tested (recently)

**note:** no user input in scripts

### basic script to install something:

```bash
#!/bin/bash

echo "update..."
sudo apt update
echo "Done!"
echo 

echo "run upgrade..."
sudo apt upgrade -y
echo "Done!"
echo

echo "install nginx..."
sudo apt install nginx -y
echo "Done!"
echo

echo "restart nginx..."
sudo systemctl restart nginx
echo "Done!"

echo " enable nginx..."
sudo systemctl enable nginx
echo "Done!"

```
**note:** echos make it easier to follow what's going on as the script runs

### Run bash script

- first give execute permissions on the file
  - `chmod +x filename.sh`
- to run, include path including current directory:
  - ./filename.sh
- `sudo systemctl status [installed service]` to check status



## Environment variables

- `echo $variable` prints regular or envinronment variable to screen
- `printenv` prints all environment varibles to screen
- `printenv EVIRONMENTVARIABLE` to print out individual variables
- `VARIABLENAME=value` to make a regular variable
- `export VARIABLENAME=value` to make it an environment variable
- variables useful when needed multiple times in a script
- environment variables can also be used in scripts
- however, these are not persistent automatically
- fix this by putting export command into config file that loads every login
  - for example, add `export MYNAME=tabitha_is_persistent` to .bashrc which already runs every time



## Processes
### What is a process?
- software/program loaded into memory
- in the old days: single-core CPU could only carry out instructions for one process at a time
- now: multi-core CPUs can process instructions for multiple processes at the same time (concurrently)
  
### What are the two types of processes?
- **user processes**
  - `ps` to view
- **system processes**
- `ps -e` to view both
- `ps -aux` to view both with useful information
- `htop` to view real-time process info
- `top` sorts by processor use
  - SHFT + N while in top to sort by newest
  - SHFT + M to sort by memory
  - SHFT + P to go back to default
- `ps -ef` shows parent process IDs

### Background processes
- `&` runs a process in the background
  - e.g. `sleep 5000 &` runs sleep in the background and terminal is still usable
  - `jobs` lets you see running processes
- to end processes currently engaging terminal, CTRL Z or CTRL C. the process will however be cancelled

### Kill processes
- `kill -1 PID` - hangup. more gentle than standard kill
- `kill PID` or `kill -15 PID` - standard kill. terminate gracefully
- `kill -9 PID` - brute force kill. last resort
- if a child process is being managed by a parent process, the parent will start another child process if one is manually killed
- if the parent process is killed (standard), child processes will attempt to be killed before the parent
- if the parent process is force killed, chil processes may not shut down and become zombie processes left running in memory with nothing to manage them
  - i.e. manual clean up of child processes may be necessary after a brute force kill


## Timeout issue

error: `client_loop: send disconnect: Broken pipe`

Disconnection message that notifies that your SSH connection timeout has been exceeded.
- seems to be an issue sometimes when ServerAliveInterval or ClientAliveInterval set to 0 in ssh config files 

To fix: increse SSH connection timeout

- ![instructions](techcmint.png) ([link]([https://](https://www.tecmint.com/client_loop-send-disconnect-broken-pipe/#:~:text=periods%20of%20time.-,Fix%20Client_loop%3A%20send%20disconnect%3A%20Broken%20pipe%20Error,%2Fetc%2Fssh%2Fsshd_config.&text=Be%20sure%20to%20locate%20these%20two%20parameters%3A%20ClientAliveInterval%20and%20ClientAliveCountMax.)))
- BUT permission to write sshd_config denied
- instead try adding `ServerAliveInterval=600` from client side when connecting (600 is 10 mins)
- which looks like: `ssh -i "tech508-tabitha-aws.pem" -o ServerAliveInterval=600 ubuntu@ec2-54-170-117-111.eu-west-1.compute.amazonaws.com`
- didn't work :/ connection still timed out in less than 10 mins
- may be a problem with public key? see https://unix.stackexchange.com/questions/602518/ssh-connection-client-loop-send-disconnect-broken-pipe-or-connection-reset


