# Terraform

- [Terraform](#terraform)
  - [Intro to Terraform](#intro-to-terraform)
    - [What is Terraform? What is it used for?](#what-is-terraform-what-is-it-used-for)
    - [Why ise Terraform?](#why-ise-terraform)
    - [Alternatives to Terraform](#alternatives-to-terraform)
    - [Who is using Terraform in the industry?](#who-is-using-terraform-in-the-industry)
    - [What is orchestration? How does Terraform act as orchestration?](#what-is-orchestration-how-does-terraform-act-as-orchestration)
    - [Best practice for supplying AWS credentials to Terraform](#best-practice-for-supplying-aws-credentials-to-terraform)
    - [Why use Terraform for different environments?](#why-use-terraform-for-different-environments)
  - [Git setup](#git-setup)
    - [.gitignore](#gitignore)
  - [Creating an EC2 instance](#creating-an-ec2-instance)
    - [Instance setup](#instance-setup)
    - [Security group](#security-group)
    - [Add SG and SSH key](#add-sg-and-ssh-key)
    - [To run](#to-run)
    - [Variables](#variables)
  - [Sparta app \& database deployment](#sparta-app--database-deployment)
    - [App](#app)
  - [Custom VPC](#custom-vpc)


## Intro to Terraform
### What is Terraform? What is it used for?
- orchestration tool - for provisioning infrastructure (deploys and manages)
- sees infrastructure as immutable (disposable)
- HCL (HashiCorp Configuration Language)
- can be converted to JSON

### Why ise Terraform?
- easy to use
- sort of open source, since 2023 BSL (Business Source License)
  - some organisations have started using OpenTofu (designed to be compatible with terraform)
- declaritive
- cloud-agnostic - can use any cloud provider
- expressive and extensible language

### Alternatives to Terraform
- Pulumi
- AWS CloudFormation 
- GCP Deployment Manager 
- ARM templates

### Who is using Terraform in the industry?
- so many

### What is orchestration? How does Terraform act as orchestration?
- managing lifecycle of infrastructure
- creating/deleting/modifying infrastructure resources in the right order

### Best practice for supplying AWS credentials to Terraform
- Uses this order:
  1. through env var (okay)
  2. terraform variables in your code (NEVER DO IT)
  3. AWS CLI shared credentials file (okay)
  4. EC2 instance metadata (assign a role - a set of permissions to EC2 instance) (BEST PRACTICE)

### Why use Terraform for different environments?
- development/testing
  - spin up infrastructure when needed and destroy it when done
- Q&A
- staging
- production
  - easily create larger-scale environment
- consistency across different environments


## Git setup
### .gitignore
Important to ignore: 
- *.tfstate
- *.tfstate.*
- *.tfvars
- *.tfvars.json
- variable.tf

Should not be ignored:
- .terraform.lock.hcl - locks terraform provider version


## Creating an EC2 instance
### Instance setup
see main.tf
- define provider
  ```terraform
  provider "aws" {
    region = "eu-west-1"
  }
  ```
- define resource: `resource "aws_instance" "web" {`
- ami to use - AMI ID ami-0c1c30571d2dae5c9 (for ubuntu 22.04 lts)
  - `ami = "ami-0c1c30571d2dae5c9"`
- type of instance to launch - t3.micro
  - `instance_type = "t3.micro"`
- add public IP to instance
  - `associate_public_ip_address = true`
- add tag for name
  - `tags = {
        Name = "tech508-tabitha-tf-first-vm"
    }`

### Security group
see SG.tf


### Add SG and SSH key
- add security group to instance
  - `vpc_security_group_ids = [
    aws_security_group.allow_22_3000_80.id]`
- add ssh key
  - `key_name = "tech508-tabitha-aws"`


### To run
- cd to folder
- `terraform init` to download provider plugins and setup tfstate files
- `terraform plan`
- `terraform apply` to create instance, also does `plan` first
- `terraform destroy` to remove anything created at end of day

**Note:** `terraform fmt` to clean up spacing


### Variables
- `variable "variable_name" {
    default = "value"
    }`
- refer to in code as `var.variable_name`
- file for variables `variable.tf` is gitignored
  - assign variables there so they are not publicly viewable

## Sparta app & database deployment
### App
see create-app-instance
- from basic instance above, change AMI ID and names to be consistent with app
- security group:



## Custom VPC
see tech508-test-terraform create-app-vpc

- follow steps from vpc.md, getting syntax from terraform deocumentation https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#user_data-1

