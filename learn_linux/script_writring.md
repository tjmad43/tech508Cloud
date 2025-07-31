# Bash Scripting

- `nano filename.sh` to create file

- `#!bin/bash` at the top of every bash script to tell it what interpreter to use

### basic steps to provision
- update
- upgrade
- install
- configure
- restart - to restart the process
- enable - add to startup menu

note: don't put commands into a script that haven't been tested (recently)
note: no user input in scripts


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
note: echos make it easier to follow what's going on as the script runs

### Run bash script

- first give execute permissions on the file
  - `chmod +x filename.sh`
- to run, include path including current directory:
  - ./filename.sh
- `sudo systemctl status [installed service]` to check status