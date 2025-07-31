# Image Resizer App

## Manual deployment on local machine (no database)

### Backend

**Create Python virtual environment**
- `python -m venv venv` to create a venv
- `source venv/bin/activate` to activate
- `pip install -r requirements` to install dependencies


**To run**
- cd to backend
- `python app.py`
- check at localhost:5000



### Frontend

- cd to frontend
- install node.js https://nodejs.org/en/download
- `npm install` to install dependencies
- `npm start` to launch
- use app at localhost:3000




## Manual deployment on EC2 Instance

**Create EC2 instance**
- Ubuntu Server 24.04 LTS, 64-bit (x86)
- Instance type: t3.micro
- Security group:
  - allow SSH
  - allow HTTP from anywhere
  - allow TCP 3000 and 5000 from anywhere
- `sudo apt update` and `sudo apt upgrade` on new instance

**File transfer**
- `rsync -avz -e "ssh -i <private key file path>" <path of file to transfer> <machine to send it to>:<where to save it>`
- e.g. `rsync -avz -e "ssh -i /Users/tabmad/.ssh/tech508-tabitha-aws.pem" /Users/tabmad/Sparta/app_code/image-processing-app-v1.0.zip ubuntu@ec2-108-129-182-224.eu-west-1.compute.amazonaws.com:/home/ubuntu`
  - `-avz` not strictly necessary. a: archive mode, preserves permissions etc. v: verbose to output more information about what's being done. z: compress file data during the transfer
  - `-e` specifying the remote shell to use
  - `ssh -i` runs SSH with the -i flag to use a specific private key file 


**Unzip file**
- `sudo apt install unzip` if not already
- `unzip image-processing-app-v1.0.zip` to unzip

**Backend**
- make sure python-venv is installed
  - `sudo apt install python3.12-venv`
- cd backend
- `python3 -m venv venv` to create a venv
- `source venv/bin/activate` to activate
- `pip install -r requirements.txt` to install dependencies
- check IP of vm
  - `curl http://checkip.amazonaws.com` -> e.g. 34.244.11.103
- `flask run --host=0.0.0.0 --port=5000` to run where it can be accessed outside the vm

**Frontend**
- make sure node is installed
  - `sudo apt install nodejs`
- cd to frontend
- npm install separately
  - `sudo apt install npm`
- `npm install` to install dependencies
- `HOST=0.0.0.0 PORT=3000 npm start` to run

**Access**
- http://(ip as found with curl):5000 for backend
- http://(ip as found with curl):3000 for frontend





## Manual deployment on local machine with database

**Install PostgreSQL**
- download from website and install
- add path to .zshrc (or .bash_profile): `export PATH="/Library/PostgreSQL/17/bin:$PATH"`