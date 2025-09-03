# EC2 Instance Storage Summary

### EBS Volumes
- network drives attached to one EC2 instance at a time
- mapped to an Availability Zone
- can use EBS Snapshots for backups/transferring EBS volumes across AZs

### AMIs
- create ready-to-use EC2 instances with customisations
- EC2 Image Builder to automatically build, test and distribute AMIs

### EC2 Instance Store
- high performance hardware disk attached to EC2 instance
- lost if instance is stopped/terminated

### EFS
- network file system
- can be attached to 100s of instances in a region
- EFS-IA cost-optimised storage class for infrequently accessed files

### FSx
- for Windows of Lustre
- high performance/network file system