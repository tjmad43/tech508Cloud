# Terraform setup

### Install
- download binary from https://developer.hashicorp.com/terraform/install (ARM64 for Apple M1)
- move folder to a directory that's in PATH
  - e.g. Users/tabmad/Library
- OR add to PATH directly
  - `nano .zshrc`
  - add `export PATH="$PATH:/Users/tabmad/Library/terraform"`
  - `source ./zshrc` to reload
- `terraform -version` to check installed

### VSCode
- install HashiCorp Terraform extension


### AWS Credentials
- to .zshrc add:
  - `export AWS_ACCESS_KEY_ID=`
  - `export AWS_SECRET_ACCESS_KEY=`
- `source ./zshrc` to reload

