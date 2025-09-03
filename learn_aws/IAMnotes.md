# IAM

IAM: Identity and Access Management
- Global service

## Create Users
- _Users_
  - _Create User_
  - set username and password
  - _Provide user access to AWS management console_ if making admin
  - _I want to create an IAM user_, more simple and for exam knowledge
  - Set permissions:
    - _Add user to group_
    - _Create group_
      - enter group name
      - policy name
    - add group to user by checking box
  - _Add new tag_
    - add any tags for categorising users

- add Account Alias to make sign in more simple

## Policies


## Guidelines and Best Practices
- only use root account for AWS account setup
- one physical user = one AWS user
- assign users to groups and assign policies to groups
- create a strong password policy
- use and enforce the use of MFA
- create and use Roles for giving permissions to AWS services
- use Access Keys for Programmatic Access (CLI/SDK)
- audit permissions of your account using IAM Credentials Report and IAM Access Advisor
- never share IAM users and Access Keys