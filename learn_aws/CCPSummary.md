# AWS Certified Cloud Practitioner Full Notes

## Cloud computing
- the on-demand delivery of compute power, database storage, applications and other IR resources

### Types
**Private cloud:**
- used by a single organisation
- complete control
- security for sensitive apps
- meet specific business needs

**Public cloud:**
- resources ownder and delivered by a third party provider(s) delivered over the internet

**Hybrid cloud:**
- some servers on premisses and some on cloud
- control over sensitive assets
- flexibility and cost effectiveness of the public cloud

### Characteristics
- **On demand self service**
  - user can provision resources and use them without human interaction from service provider
- **Broad network access**
  - resources available over the network, and can be accessed by diverse client platforms
- **Multi-tenancy resource pooling**
  - multi customers can share same infrastructure and applications with security and privacy
  - multi customers are serviced from the same physical resources
- **Rapid elasticity and scalability**
  - automatically and quickly acquire and dispose of resources when needed
  - quickly scale based on demand
- **Measured service**
  - usage is measured, users pay correctly for what they have used

### Advantages
- **Trade capital expense (CAPEX) for operational expense (OPEX)**
  - pay on demand: don't own hardware
  - rediced total cost of ownership (TCO) and Operational expense (OPEX)
- **Benefit from massive economies of scale**
  - prices are reduced as AWS is more efficient due to large scale
- **Stop guessing capacity**
  - scale based on actual measured usage
- **Increased speed and agility**
- **Stop spending money running and maintaining data centres**
- **Go global in minutes**

### Problems solved
- **Flexibility:** change resources when needed
- **Cost effectiveness:** only use what you pay for
- **Scalability:** accommodate larger workloads by making hardware stronger or adding aditional nodes
- **Elasticity:** ability to scale out and in when needed
- **High availability and Fault tolerance:** build across data centres
- **Agility:** rapidly develop, test and launch software apps

### Types of cloud service
1. **Infrastructure as a service (most responsibility)**
   - provides building blocks for cloud IT
   - provides networking, computers, data storage space
   - highest level of flexibility
   - e.g.:
     - EC2
  
2. **Platform as a service**
   - removes need for your organisation to manage underlying infrastructure
   - focus on deployment and management of applications
   - e.g.:
     - Elastic Beanstalk

3. **Software as a service (everything managed)**
   - complete product that is run and managed by a service provider including platform and infrastructure

### Pricing
AWS has 3 pricing fundamentals, the following pay as you go pricing models
- **Compute**
  - pay for compute time
- **Storage**
  - pay for data stored in the cloud
- **Data transfer OUT of cloud**
  - data transfer in is free

### Regions
How to choose a region?
- **Compliance with data governance and legal requirements**
  - data may not be able to leave a country without gov permission (GDPR & data protection)
- **Proximity to customers**
  - reduce latency
- **Available services in region**
  - not all services are available in every region
- **Pricing**
  - pricing in different regions vary

### Shared responsibilty
**Customer**
responsibility for security *in* the cloud
- customer data
- platform, applications, identity & access management
- operating system, network & firewall config
- client-side data encryptions & data integrity authentication
- server-side encryption (file system and/or data)
- networking traffic protection (encryption, integrity, identity)

**AWS**
responsibility for security *of* the cloud
- software:
  - compute
  - storage
  - database
  - networking
- hardware/AWS global infrastructure:
  - regions
  - availability zones
  - edge locations

## IAM: Identity and Access Management
### IAM Users & Groups
- IAM = Identity and access management, **Global service**
- Root account created by default, shouldn't be used or shared
- Users are people in your organisation, can be grouped
- Groups can only contain users and not other groups but users can belong to multiple groups

### Permissions
- users or groups can be assigned JSON documents called policies
- these define permissions of the user
- apply **least privilege principle**: don't give more permissions that are necessary
- users can inherit policies based on their group, including multiple groups

### Password policy
strong passwords = higher security

set up a password policy to control:
- min password length
- special characters
- lower & upper case letters
- numbers
- allow IAM users to change their passwords
- require users to change password after a period of time
- prevent password reuse

### Multi factor authentication (MFA)
- password + security device 
- is password is stolen the who AWS account isn't compromised
- **Virtual MFA devices:** google autheticator etc
- **Universal 2nd Factor (U2F) Security Key:** Yubikey (3rd party) single store key
- **Hardware keyfob:** Gemalto (3rd party), surepassID

### Amazon Cognito Identity Pool
- provides temporary AWS credentials for guest users (unauthenticated) and for authenticated users who have recieved a token
- identity pool is a store of user identity data specific to your account

### How to access AWS
- **AWS management console** (web interface)
- ***AWS CLI** (command line interface)
  - direct access to public APIs of AWS services
  - develop scripts to manage resources
  - open source
- **AWS SDK** (software developer kit)
  - language specific APIs
  - enables access and management of AWS services programmatically
  - embedded within applications
  - supports SDKs (Js, python, PHP etc)
  - mobile SDS
  - IOT devices

### IAM Roles for services
- some AWS services perform actions on your behalf - assign permissions to them with IAM roles
- IAM entity defines a set of permissions for making AWS service requests, used by AWS services

### Security tools
- **IAM Credentials Report (Account level)**
  - audit report that lists all accounts users and the status of their various credentials
- **IAM Access Advisor (User level)**
  - shows the service permissions granted to a user and when those services were last accessed
  - can use info to revise policies

### Guideline and best practices
- don't use root account except for AWS account setup
- one physical user = one AWS user
- assign userse to groups to assign permissions on group levels
- use and enfore MFA for logins
- create and use roles for giving permissions to AWS services
- use access keys for programmatic access (CLI/SDK)
- audit permissions of your accounts with IAM credentials report
- never share IAM users & access kets

### Shared Responsibility Model for IAM
**AWS responsible for:**
- infrastructure (global network security)
- configuration and vulnerability analysis
- compliance validation
**Customer is responsible for:**
- users, groups, policies management and monitoring
- enable MFA on all accounts
- rotate all keys often
- use IAM tools to apply appropriate permissions
- analyse access patterns and review permissions

## EC2 - Elastic Cloud Compute
### Basics
- EC2 = Elastic Compute Clous = infrastructure as a service (a virtual machine)
- capability of renting vms & storing data on virtual drives (EBS)
- distribute load across machines (ELB)
- scaling services using an auto scaling group (ASG)

### Sizing & config options
- OS: linux, windows, macOS
- compute power (CPU)
- RAM
- storage space: network attached (EBS), hardware (EC2 instance store)
- network card: speed of card, public IP address
- firewall rules: security group
- bootstrap script (configure at first launch): EC2 user data

### Instance types
Naming convention: **M5.2Xlarge**
- **M**: instance class
- **5**: generation version
- **2Xlarge**: size within the instance class

**General purpose**
- great for a diveresity of workloads
- have a good balance between compute, memory and networking

**Compute optimised**
- for compute-intensive tasks that require high performance processors
  - batch processing workloads
  - media transcoding
  - high performance web servers
  - high performance computing
  - scientific modelling & machine learning

**Memory optimised**
- fast performance for workloads that process large datasets inn memory
  - high performance databases
  - distributed web sale cache stores
  - in-memory databases optimised for BI
  - application performing real-time processing of big unstructured data

**Storage optimised**
- for storage intesive tasks that require high, sequiential read and write access to large datasets on local storage
  - high frequency online transaction processing (OLTP) systems
  - relational & NoSQL databases
  - cache for in-memory databases
  - data warehousing applications
  - distributed file systems

### EC2 instance purchasing options
- **On demand instances:** short workload, predictable pricing
  - windows & linux billed per second (after first min), others billed per hour
  - highest cost but no upfront payment or long term commitment
  - recommended for short term and un-interrupted workloads
- **Reserved instances:** workloads over a long period of time (min 1 year)
  - up to 75% discount compared to on-demand
  - reservation period: 1 year = +discount | 3 years = +++discount
  - reserves a specific instance type
  - recommended for steady state usage applications
  - **Convertible reserved instances:** long workloads with flexible instances
    - can change instance type
    - up to 54% discount
  - **Scheduled reserved instances:** e.g. every thurs between 3-6pm
    - launch within a time window you reserve
    - when you require a fraction of a day/week/month
    - still committed over 1 - 3 years
- **Spot instances:** short workloads, cheap, can lose instances (not reliable)
  - discount up to 90%
  - can lose instances at any point if your max price is less than current spot price
  - useful for workloads resilient to failure: batch jobs, data analysis, image processing, workloads with flexible start time
  - not suitable to critical jobs or databases
- **Dedicated host:** book an entire physical server, control instance placement
  - physical server with EC2 instance capacity fully dedicated to your use
  - helps addreess compliance requirements and reduce costs by allowing you to use existing server bounch software licenses
  - allocated for your account 1 or 3 year period
  - more expensive
  - useful for software with complicated licensing model or strong regulatory needs

### Shared Responsibility
**AWS:**
- infrastructure (gloabel network security)
- isolation on physical hosts
- replacing faulty hardware
- compliance validation

**Customer:**
- security group rules
- operating system patches and updates
- software and utilities installed on the instance
- IAM roles assigned to EC2 and IAM user access management
- data security on your instance

### Security Groups
- control how traffic is allowed into and out of EC2 instances
- allow rules and can be referenced by IP or by security group
- they regulate:
  - access to ports
  - authorised IP ranges
  - control of inbound network (from other instances)
- can be attached to multiple instances
- locked down to a region or vpc
- lives outside EC2
- by default all inbound traffic blocked and outbound authorised

## EC2 Instance Storage
### EBS Volumes
- an Elastic Block Store Volume is a network drive you can attach to instances while they run
- allows instances to persist data, even after termination
- can only be mounted to one instance at a time
- bound to an availability zone
- by default set to terminate with EC2 instance

### EBS Snapshot
- make a backup (snapshot) of EBS volume at a point in time
- not necessary to detach first but recommended
- can copy a snapshot across AZ or region

### AMIs
- Amazon Machine Image - customisation of an EC2 instance
- add your own software, config, OS, monitoring
- faster boot/config time because pre-packaged
- built for a specific region and can be copied across regions
- can launch an EC2 instance from:
  - a public AMI (provided by AWS)
  - your own AMI
  - an AWS Marketplace AMI (an AMI made/sold by someone else)

### EC2 Image Builder
- used to automate the creation of virtual machines or container images
- automate the creation, maintain, validate and test EC2 AMIs
- can be run on schedule
- free service

### EFS - Slastic File System
- managed NFS (network file system)
- can be mounted to many EC2 instances at a time (EBS only 1)
- works with linux EC2 instances in multiple AZ
- highly available, scaleable, expensive, pay per use
- synced shared files

### EFS Infrequent Access (EFS-IA)
- storage class that is cost optimised for files not accessed every day
- up to 92& lower cost for storing data compared to EFS standard
- EFS will automatically move files to EFS-IA based on last time accessed
- can define own EFS-IA policy

### Shared Responsibility Model
**AWS:**
- infrastructure
- replication for data for EBS volumes & EFS drives
- replacing faulty hardware
- ensuring their employees cannot access your data

**Customer:**
- setting up backup/snapshot procedures
- setting up data encryption
- responsiblity of any data on the drives
- understanding the risk of using EC2 Instance Store

### Amazon FSx
- launch third party high-performance file systems on AWS
- fully managed service
**FSx for Windows File server**
- fully managed, highly reliable and scalable Windows native shared fiel system
- built on Windows file server
- supports SMB protocool & Windows NTFS
- integrated with microsoft active directory
**FSx for LUSTRE server**
- fully managed, high performance and scalable file system for high performance computing
- name derived from linux + cluster
- machine learning, analytics, video processing, financial modelling
- scales up to 100 GB/s, millions of IOPS,sub-ms latency


## ELB & ASG
### Load balancing
- servers that forward internet traffic to multiple EC2 instances downstream
- spreads load across multiple instances
- expose a single point of access (DNS) to your app
- seamlessly handdle failures of downstream instances
- do regular health checks of instances
- provide SSL termination (HTTPS) for your websites
- high availability across zones

### ELB (Elastic Load Balancer)
- AWS guarantees it will work
- takes care of upgrades, maintenance and high availability
- provides only a few config knobs
- it costs less to set up your own load balancer but maintenance and integration is a lot of effort
- 3 kinds of load balancer:
  - Application load balancer (HTTP/HTTPS) - layer 7 (used in HTTP and applications)
  - Network load balancer (ultra high performance, allows for TCP) - layer 4 (used in gaming as it can handle millions of requests at a time)
  - Gateway load balancer
    - provides bothh layer 3 & 4 load balancing capabilities
    - transparent bump-in-the-wire device that does not change any part of the packet
    - architected to handle millions of requests/second, volatile traffic patterns, introduces extremeley low latency

### Auto Scaling Groups (ASG)

