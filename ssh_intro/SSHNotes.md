# SSH

The SSH protocol (Secure Shell) is a method for secure remote login from one computer to another. It provides several alternative options for strong authentication, and it protects communications security and integrity with strong encryption. It is a secure alternative to the non-protected login protocols (such as telnet, rlogin) and insecure file transfer methods (such as FTP).

### What is an SSH key?
- a key pair - private and public

### Why do we use them?
- more secure method of pushing and pulling - 4096 bits is significantly longer than a normal password and almost impossible to crack
- plus encryption

## Typical uses of the SSH protocol
The protocol is used in corporate networks for:

providing secure access for users and automated processes
interactive and automated file transfers
issuing remote commands
managing network infrastructure and other mission-critical system components.


## Steps for SSH on git
1. Create SSH key
   - SSH key pair (type: RSA)
     - asymmetric - private key and public key.
     - private key can generate public key.
2. Register the public key
3. Add private key to SHH register (locally)
4. Create a test repo on git
5. Push changes to repo using SSH


### In action:

1. - cd ~
   - cd .ssh or mkdir .ssh
   - ssh-keygen -t rsa -b 4096 -C "tabbymadhavan@gmail.com"
   - filename is tabitha-github-key
   - file with no .pub extension (or sometimes with .pem) is PRIVATE key, do not share
2. - github -> settings -> SSH and GPG keys
   - make title same as file: tabitha-github-key
   - cat tabitha-github-key.pub in terminal
   - paste into key textbox - NO EXTRA SPACES OR CHARACTERS
   - click add key
3. - eval `ssh-agent -s`
   - for above ^ backticks included
   - ssh-add tabitha-github-key
4. - ssh -T git@github.com
5. - create new repo on github website
   - cd to location for repo
   - follow instructions for new repo but with SSH:
   - ![newRepo](newrepo.png)
   - mkdir tech508-test-ssh
   - cd tech508-test-ssh
   - git init
   - git add .
   - git commit -m "note"
   - git remote add origin git@github.com:tjmad43/tech508-test-ssh.git
   - git push -u origin main