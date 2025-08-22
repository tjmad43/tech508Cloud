# CICD
### What is CICD? Benefits?
**CI:** Continuous Integration
- Trigger: developers frequently pushing code changes to shared repo
- Those changes need to be:
  1. tested, if passes tests:
  2. integrated (merge code changes to "main" branch)
- Benefits:
  - identify and resolve bugs early (saves time and money)
  - helps to maintain a stable and functional software build

**CD:** Continuous Deployment, or Continuous Delivery
- Deployment: getting the updated code to run for end users to benefit
- Delivery: about having the code (often packaged/compiled) ready to be deployed
  - often produces a versioned artifact of the software
  - used for manual intervention/approval
- Benefits:
  - **possible to very quickly and frequently get code changes into the hands of end users**

### What is Jenkins?
- automation serever
- often used for CICD pipeline
- Benefits: 
  - open source
  - automation of CICD
  - extensibility: at least 1800 plugins
  - scalability: worker nodes spin to meet demands with jobs
  - commmunity support
  - customisation
  - cross-platform

### Alternatives to Jenkins
- GitHub Actions
- Azure DevOps
- GitLab CICD
- CircleCI
- Travis CI
- Bamboo
- TeamCity
- GoCD

### Stages of Jenkins
1. Source Code Management
2. Build code
3. Test code
4. Package (usually)
5. Deploy the code
6. Monitor (often)

