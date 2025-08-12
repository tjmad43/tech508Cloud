# AWS S3 Storage

**S3:** **S**imple **S**torage **S**ervice

- equivalent on Azure Blob Storage
- blobs/files go into buckets (equivalent on Azure is container)
- can be used easily to host a static website on the cloud
- use s3 to:
  - store data on cloud
  - make blobs public, get a URL/endpoint to access from anywhere (everything is private by default)
  - provide built-in redundancy
- access from AWS Console and AWS CLI (command line interface)


## Using S3 buckets

### Setup
- fresh instance from AMI (already updated and upgraded)
- make sure AWS CLI is installed:
  - `aws --version`
- if not:
  - `sudo apt install python3-pip`
  - `sudo pip install awscli`
- `alias python=python3` so we don't need to type python3 every time
- `aws s3 help` for help & commands
- AWS configuration:
  - `aws configure`
  - log in with credentials
  - region: eu-west-1
  - output formal: json
- `aws s3 ls` to see list of buckets
  
### Create bucket
- `aws s3 mb s3://<name of bucket> --region <region e.g. us-west-1>`
- region is not necessary
  - e.g. `aws s3 mb s3://tech508-tabitha-first-bucket`

### Manage files
- `aws s3 ls s3://<name of bucket>` to see what's in a bucket
- files:
  - make a test file : `echo "this is the first line in a test file" > test.txt`
    - view: `cat test.txt`
  - `aws s3 cp <filename> s3://<bucket name>` to copy that file to bucket
- downloads:
  - make downloads folder: `mkdir downloads`
    - `cd downloads`
  - `aws s3 sync s3://<name of bucket> <path where you want the files downloaded>` to download from bucket
    - e.g. `aws s3 sync s3://tech508-tabitha-first-bucket .`
- delete files:
  - `aws s3 rm s3://<name of bucket>/<name of file to remove>`
    - e.g. `aws s3 rm s3://tech508-tabitha-first-bucket/test.txt`
  - `aws s3 rm s3://<name of bucket> --recursive` to delete everything in a bucket
    - **Note:** DANGEROUS!!
    - e.g. `aws s3 rm s3://tech508-tabitha-first-bucket --recursive`
- delete bucket:
  - if empty:
    - `aws s3 rb s3://<name of bucket>`
      - e.g. `aws s3 rb s3://tech508-tabitha-first-bucket`
  - if not empty:
    - `aws s3 rb s3://<name of bucket> --force`
      - **Note:** VERY DANGEROUS!!
      - `aws s3 rb s3://tech508-tabitha-first-bucket --force`
  

