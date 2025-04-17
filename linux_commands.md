
# **Linux Commands Guide**

---

## Navigating the Filesystem

### 1. `pwd`

Displays the full path of the current working directory.

```bash
joel@server-santander-linux:~$ pwd
/home/joel
```

### 2. `cd`

Changes the current directory.

```bash
cd /        # Goes to the root directory
cd ~        # Goes to the user's home directory
cd ..        # Moves up one level in the directory hierarchy
cd ../dev   # Moves up one level, then into the 'dev' directory
cd dir/sub  # Goes directly into a subdirectory path
```

---

## File and Directory Management

### 1. `mkdir`

Creates a new directory.

### 2. `touch fileName`

Creates an empty file.

### 3. `rm`

Deletes files.

```bash
rm file.txt
```

### 4. `rm -rf`

Deletes files and directories recursively and forcibly (⚠️ Be careful!).

### 5. `rmdir directoryName`

Removes **empty** directories only.

---

## Viewing and Editing Files

### 1. `cat file`

Displays the contents of a file.

### 2. `nano file`

Opens the file in the Nano text editor for editing (if the fileName doesn't exists, it create itself).

### 3. `vi file`

Opens the file in the Vi editor (if the fileName doesn't exists, it create itself).

- Press `i` to start editing.
    
- Press `Esc` to exit editing mode.
    
- Type `:wq` to save and quit.
    

---

## Filtering and Searching

### 1. `ls`

Lists files and directories in the current folder.

### 2. `ls | more`

Displays long outputs one page at a time.

### 3. `find -name pattern`

Searches for files matching the pattern from the current directory.

```bash
find -name file*
```

### 4. Common `ls` patterns:

| Command         | Description                                             |
| --------------- | ------------------------------------------------------- |
| `ls a*`         | Lists items starting with "a"                           |
| `ls *a`         | Lists items ending with "a"                             |
| `ls *a*`        | Lists items containing "a"                              |
| `ls a?`         | Items starting with "a" and exactly one more character  |
| `ls a??`        | Items starting with "a" and exactly two more characters |
| `ls file[1-3]*` | Files starting with file1, file2, or file3              |
| `ls [a-c]*`     | Files starting with letters a, b, or c                  |
| `ls *.[ch]`     | Files ending in .c or .h (C programming files)          |
| `ls [!a]*`      | Files that do **not** start with "a"                    |
| `ls *[0-9]`     | Files ending with a number (0–9)                        |

---

## User Management

### Creating, deleting, and setting passwords:

```bash
useradd userName
userdel -f userName
passwd userName
```

### Creating a user with home and shell:

```bash
useradd joyce -m -c "Joyce Travassos" -s /bin/bash
```

### Changing a user's shell:

```bash
chsh -s /bin/bash userName
usermod userName -s /bin/bash
```

### List all users:

```bash
cat /etc/passwd
```

### Create a user with password:

```bash
useradd joyce -c "Joyce Travassos" -s /bin/bash -m -p $(openssl passwd -1 1712)
```

>  `-p` sets an encrypted password. `-1` means MD5 hash.

---

## Shell Script: Creating Multiple Users

Create the script with `nano createUsers.sh`:

```bash
#!/bin/bash

echo "Creating System users..."

useradd guest1 -c "Guest user" -s /bin/bash -m -p $(openssl passwd -1 pass123)
passwd guest1 -e

useradd guest2 -c "Guest user" -s /bin/bash -m -p $(openssl passwd -1 pass123)
passwd guest2 -e

useradd guest3 -c "Guest user" -s /bin/bash -m -p $(openssl passwd -1 pass123)
passwd guest3 -e

useradd guest4 -c "Guest user" -s /bin/bash -m -p $(openssl passwd -1 pass123)
passwd guest4 -e
```

### Notes:

- `#!/bin/bash`: Defines the interpreter for the script.
    
- `passwd -e`: Forces the user to change the password at first login.
    

### Make it executable and run:

```bash
chmod +x createUsers.sh
./createUsers.sh
```

---
## Shell Script: Deleting Multiple Users

```bash
#!/bin/bash

echo "Deleting all the guest* System users..."

userdel -r -f guest1

userdel -r -f guest2

userdel -r -f guest3

userdel -r -f guest4

echo "All done! Users were deleted."
```

### Make it executable and run:

```bash
chmod +x deleteUsers.sh
./deleteUsers.sh
```

---

## Working with Groups

### View groups:

```bash
cat /etc/group
```

### Creating Groups:

```shell
groupadd GRP_ADM
groupadd GRP_TI
```

### Deleting Groups:

```shell
groupdel GRP_ADM
groupdel GRP_TI
```
### How to add a user in one or more groups:

If the user is already in a group, he will be removed from it.

**Adding a user in one group**
```shell
usermod -G adm userName
```

**Adding a user in two groups**
```shell
usermod -G adm,sudo userName
```

### How to remove a user from a specific group:

```shell
gpasswd -d  userName groupName
```

use `gpasswd --help` if you need help.

### How to create and add a user in a group:

```shell
useradd guest1 -c "Guest user" -s /bin/bash -m -p $(openssl passwd -1 pass123) -G GROUP_NAME
```
---

## Root User

### Set a password for the root user:

```bash
sudo passwd root
```

### Switch to root:

```bash
su
```

### Switch back to another user:

```bash
su userName
```

---

## Remote Root Access via SSH

1. Edit the SSH config file:
    

```bash
sudo nano /etc/ssh/sshd_config
```

2. Find the line:
    

```bash
#PermitRootLogin prohibit-password
```

3. Change it to:
    

```bash
PermitRootLogin yes
```

4. Restart the SSH service:
    

```bash
sudo systemctl restart ssh
```

---

## Using SSH (on the same network)

### Server Side:

1. Install SSH server:
    

```bash
sudo apt-get install openssh-server
```

2. Get the IP address:
    

```bash
ip a
```

3. Make sure the network is in bridge mode.
    

### Client Side:

Connect to the server:

```bash
ssh userName@ipAddress
# Example:
ssh joel@192.168.1.29
```

---

## Getting Help

- `command --help`: Shows quick help.
    
- `man command`: Opens the full manual page for a command.
    

---

## Command Line Prompt Breakdown

```bash
joel@server-santander-linux:~$
```

- `joel`: Username
    
- `@`: At
    
- `server-santander-linux`: Hostname
    
- `~`: Home directory
    
- `$`: Normal user
    
- `#`: Superuser (root)
    