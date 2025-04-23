## Copying a file

### 1. `cp --help` 

Use this command to display what you can do with this `cp`command.

```shell
root@server-santander-linux:/# cp --help
Usage: cp [OPTION]... [-T] SOURCE DEST
  or:  cp [OPTION]... SOURCE... DIRECTORY
  or:  cp [OPTION]... -t DIRECTORY SOURCE...
Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY.
....
```
---
### 2. `cp source_and_file_name destination`

We need to inform the source of the file, file name and destination.

For exemple:

```shell
root@server-santander-linux:/# cp home/joel/file1.txt /mnt/disk2
```

If you are already in the file directory, you don't need to specify the source of the file, you only need to inform the name of the file and the destination.

For exemple:

```shell
root@server-santander-linux:/home/joel# cp file2.txt /mnt/disk2
```

As you can see bellow, both files have been copied to the destination directory.

```shell
root@server-santander-linux:/home/joel# ls /mnt/disk2
file1.txt  file2.txt  lost+found
```
---
### 3. `cp source_and_files destination`

You can copy more them one file with one command. If you use the command `cp *.txt /mnt/disk2` you will copy all of files that ending with `.txt`.

```shell
root@server-santander-linux:/home/joel# cp *.txt /mnt/disk2
root@server-santander-linux:/home/joel# ls /mnt/disk2
file1.txt  file2.txt  file3.txt  file4.txt  file5.txt  lost+found
```

---
## Moving a file
### 1. `mv source_and_file_name destination`

It'll move the file to a specified directory (It works like crtl+x)

```shell
root@server-santander-linux:/home/joel# ls
Documents  file1.txt  file2.txt  file3.txt  file4.txt  file5.txt  jaja
root@server-santander-linux:/home/joel# mv *txt /mnt/disk2
root@server-santander-linux:/home/joel# ls
Documents  jaja
```
---
## Manage process

### 1. `ps`

The `ps` command on Linux stands for **"process status"**. It shows information about the currently running processes on the system.

By default, if you just type `ps`, you'll see processes associated with your current terminal session. Here's a breakdown of what `ps` can do and some common options:

#### Commonly Used Options

- `ps aux` – Shows **all running processes** on the system in a detailed format.
    
    - `a`: all users
        
    - `u`: user-oriented format (includes user, CPU%, MEM%)
        
    - `x`: includes processes not attached to a terminal
        

```shell
ps aux
```

- `ps -ef` – Another common format for showing all processes (similar to `aux`, but uses standard UNIX format).
    
    - `-e`: all processes
        
    - `-f`: full-format listing
        

```shell
ps -ef
```
---
### 2. `kill process_pid`

The `kill` command **sends a signal to a process by its PID (Process ID)**. By default, it sends the `SIGTERM` signal (signal 15), which politely asks the process to stop.

```shell
kill 1234
```

This sends a request for the process with PID `1234` to terminate.

If the process doesn’t stop, you can **force it** using the `-9` signal (`SIGKILL`):

```shell
kill -9 1234
```

Warning: `-9` forces termination without allowing the process to clean up or save data.

---
### 3. `killall process_name` 

Kills **all processes** with the exact name:

```shell
killall firefox
```

Force kill:

```shell
killall -9 firefox
```
