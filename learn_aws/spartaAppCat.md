# Sparta App Cat Image

- [Sparta App Cat Image](#sparta-app-cat-image)
  - [Task](#task)
  - [Step 1: Do it manually](#step-1-do-it-manually)
    - [Download and save image to bucket](#download-and-save-image-to-bucket)
    - [Make image public](#make-image-public)
    - [Change app image](#change-app-image)
  - [Step 2: Automate](#step-2-automate)
    - [Reverse Script](#reverse-script)


## Task
Pre-requisites
- You will need an EC2 instance running the Sparta test app

Step 1: Do it manually
- Find a cat image on the web (either jpeg, jpg, or png)
- Download it onto your VM
- Upload it to S3 storage to your own bucket
- Set permissions to make your uploaded cat image publicly accessible
- Modify the app's homepage to include the cat image saved & use pm2 command(s) to see the changes take effect in your refreshed web browser tab

Step 2: Automate
- Create a Bash script called use-s3-image-on-homepage.sh to make bucket, upload the cat image to S3, set permissions for public access, modify the app code to use to uploaded image, and run the app (make sure you decide on the most logical order for these steps in your script).

What this script does NOT need to do:
- Install AWS CLI
- Run the aws configure command and log you in with your access credentials
- Create a Bash script called revert-to-normal-homepage.sh to reverse all the changes made by your first script (make sure you decide on the most logical order for these steps in your script - think about it from your end users' experience).

Test to make sure:
- You can alternate between running one script and the other continally, so that one makes the changes and the other reverse all the changes.
- Make sure your scripts will work whether the app is running or not initially

Deliverables:
- once you have finished the first script + you run it - post the link in the chat, wait for a thumbs up from your trainer
run your other script, post the link in the chat so can see it changed back, once you have another thumbs up from your trainer
documentation on how and WHY you completed the task - it should be ready to share on the screen for tomorrow 9:30am. Please include:
  - how S3 storage works to provide redundancy, high availability and helps with disaster recovery


## Step 1: Do it manually

### Download and save image to bucket
- download file to VM: `curl URL --output filename.extension`
  - `curl https://i.pinimg.com/736x/b4/d7/55/b4d755b92eb04d33fde73341b8c557cb.jpg --output cat.jpg`
- make bucket to go in: `aws s3 mb s3://tech508-tabitha-cat-bucket`
- copy image to bucket: `aws s3 cp cat.jpg s3://tech508-tabitha-cat-bucket`

### Make image public
- update ACL (access control list) of the file to make public: `aws s3api put-object-acl --bucket DOC-EXAMPLE-BUCKET --key exampleobject --acl public-read`
    - `aws s3api put-object-acl --bucket tech508-tabitha-cat-bucket --key cat.jpg --acl public-read`
    - Access Denied: public access control lists (ACLs) are blocked by the BlockPublicAcls block public access setting
- try: `aws s3 cp cat.jpg s3://tech508-tabitha-cat-bucket --acl public-read` when uploading to bucket instead
  - `An error occurred (AccessControlListNotSupported) when calling the PutObject operation: The bucket does not allow ACLs`

### Change app image
- html is at `/repo/app/views/index.ejs`
```html
<!DOCTYPE html>
<html>
<head>
  <title>Provisioning Test Page</title>
  <link href="https://fonts.googleapis.com/css?family=Slabo+27px" rel="stylesheet">
  <style type="text/css">
    body {
      text-align:center;
      font-family: 'Slabo 27px', serif;
      height:100vh;
    }
    .vertical-center {

      position:relative;
      top:50%;
      transform: translateY(-50%);
    }
    img {
      width: 150px;
    }
  </style>
</head>
<body>
  <div class="vertical-center">
    <h1>Welcome to the Sparta Test App</h1>
    <img src="/images/squarelogo.jpg" />
    <h2>The app is running correctly.</h2>
    
  </div>
</body>
</html>
```
- nano in and change img src to cat image:
  - `https://tech508-tabitha-cat-bucket.s3.amazonaws.com/cat.jpg`
- `pm2 stop all` and `pm2 start app.js` to re-run the app with new image


## Step 2: Automate

```bash
!#/bin/bash

echo "Downloading image..."
curl https://i.pinimg.com/736x/b4/d7/55/b4d755b92eb04d33fde73341b8c557cb.jpg --output cat.jpg
echo "Done"
echo

echo "Copying to cloud..."
aws s3 mb s3://tech508-tabitha-cat-bucket
aws s3 cp cat.jpg s3://tech508-tabitha-cat-bucket --acl public-read
echo "Done"
echo

echo "Replacing image..."
sudo sed -i 's|/images/squarelogo.jpg|https://tech508-tabitha-cat-bucket.s3.amazonaws.com/cat.jpg' /repo/app/views/index.ejs
echo "Done"
echo

echo "Restarting app..."
cd /repo/app
pm2 stop all
pm2 start app.js
echo "Done"

```

### Reverse Script

```bash
!#/bin/bash

echo "Changing image back..."
sudo sed -i 's|https://tech508-tabitha-cat-bucket.s3.amazonaws.com/cat.jpg|/images/squarelogo.jpg|' /repo/app/views/index.ejs
echo "Done"
echo

echo "Restarting app..."
cd /repo/app
pm2 stop all
pm2 start app.js
echo "Done"
echo 

echo "Cleaning up files..."
aws s3 rm s3://tech508-tabitha-cat-bucket/cat.jpg
aws s3 rb s3://tech508-tabitha-cat-bucket
rm cat.jpg
echo "Done"
echo

```

- disable block public acces
- ownership-controls 'Rules=[ObjectOwnership=]
- add read only bucket policy
- making things public is difficult on purpose
