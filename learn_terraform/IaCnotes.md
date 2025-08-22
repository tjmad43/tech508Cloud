# Infrastructure as Code

What have we automated?
- VMs
  - Creation of VMs? - NO
  - Creationg of infrastructure where VMs live? - NO
  - Setup and configure the software - YES
    - Bash scripting
    - User data
    - Images

What is the problem that needs solving?
- We are still manually provisioning servers
  - Provisioning: the process of setting up and configuring servers

IaC 
- Codifying: 
  - what you want (declarative), not the steps (imperative) to do it
  - defining the desired state/outcome
- A way to manage and provision computers through machine-readable definitions of 

Two main types of IaC tools
- Configuration management tools
  - Examples: Chef, Puppet, Ansible
  - Configures the software
- Orchestration tools
  - Examples: Terraform, CloudFormation (AWS), ARM/Bicep templates (Azure)
  - Ansible (can do, wasn't designed for)
  - Manages infrastructure
