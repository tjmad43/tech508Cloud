# CICD with Jenkins

## Intro
### Job 1
New item:
- name: tabitha-first-project
- Freestyle project
- _OK_

- Description: testing jenkins
- Discard old builds: check
  - max: 5
- Build steps:
  - Add build step: Execute shell
    - `uname -a`
- _Save_
- _Build now_ to add to queue
- click job link in Build History
    - _Console output_

### Job 2
- same as previous
- `date` in Execute shell

### Link jobs together
- go to first job
  - _Configure_
  - _Add post-build action_
    - Build other projects
    - Trigger only if build is stable
    - add job names (separated by comma if more than one)
- when first job run successfully, second job will run

### What not to do
- anything in _Manage Jenkins_


