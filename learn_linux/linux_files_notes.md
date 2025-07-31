# Files in Linux


## Managing file ownership

- **Why is managing file ownership important?**
  - maintaining security 
  - enabling collaboration 
  - ensuring proper system administration

- **What is the command to view file ownership?**
  - `ls -l` will show owner and group-owner of files

- **What permissions are set when a user creates a file or directory? Who does file or directory belong to?**
  - when a file or directory is created, default permissions are set
    - which are: rw-r--r-- 
    - meaning the owner can read and write, all others can only read
  - the file's creator is the default owner

- **Why does the owner, by default, not receive X permissions when they create a file?**
  - it is often not necessary, most files are not created to be executed 
  - can pose security risks if inadvertently granted. Being automatically able to execute any text file or downloaded file could lead to accidentally running malicious scripts or corrupted files

- **What command is used to change the owner of a file or directory?**
  - `chown new-owner filename`


## Managing file permissions

- **Does being the owner of a file mean you have full permissions on that file? Explain.**
  - default permissions for the owner of a file, as above, are read write only
  - however, being the owner grants permission to change file permissions and ownership

- **If you give permissions to the User entity, what does this mean?**
    - User permissions affect only the owner of the file

- **If you give permissions to the Group entity, what does this mean?**
    - Group permissions are granted to all users who are members of the group assigned to that file
    - the Group entity in file permissions refers to that assigned group, not all groups on the system

- **If you give permissions to the Other entity, what does this mean?**
    - Other permissions affect everyone that does not get User or Group permissions

- **You give the following permissions to a file: User permissions are read-only, Group permissions are read and write, Other permissions are read, write and execute. You are logged in as the user which is owner of the file. What permissions will you have on this file? Explain.**
    - as the User, you would have read-only permissions (r--)

- **Here is one line from the ls -l. Work everything you can about permissions on this file or directory. `-rwxr-xr-- 1 tcboony staff  123 Nov 25 18:36 keeprunning.sh`**
    - starts with - meaning it is a file
    - User, `tcboony`, has read, write, execute permissions (rwx)
    - Group, `staff`, has read, execute permissions (r-x)
    - Other has read-only permissions (r--)


## Managing file permissions numerically

- What numeric values are assigned to each permission?
  - r (read): 4
  - w (write): 2
  - x (execute): 1

- What numeric values would you use to assign read + write permissions?
  - rw- = 4+2+0 = 6


- What numeric values would you use to assign read, write and execute permissions?
  - rwx = 4+2+1 = 7


- What numeric values would you use to assign read and execute permissions?
  - r-x = 4+0+1 = 5


- Often, a file or directory's mode/permissions are represented by 3 numbers. What do you think 644 would mean?
  - Octal (base 8) format
  - User = 6 = rw-
  - Group = 4 = r--
  - Other = 4 = r--


## Changing file permissions

- What command changes file permissions?
  - `chmod`

- To change permissions on a file what must the end user be? (2 answers)
  - the User/owner of the file
  - the superuser (root)


- Give examples of some different ways/syntaxes to set permissions on a new file (named testfile.txt) to:
  - Set User to read, Group to read + write + execute, and Other to read and write only
    - `chmod u+r,g+rwx,o+rw testfile.txt` OR
    - `chmod 476 testfile.txt`
  - Add execute permissions (to all entities)
    - `chmod a+x testfile.txt` (a+x = all + execute)
    - or just `chmod +x testfile.txt`
  - Take write permissions away from Group
    - `chmod g-w testfile.txt`
  - Use numeric values to give read + write access to User, read access to Group, and no access to Other.
    - `chmod 640 testfile.txt`
