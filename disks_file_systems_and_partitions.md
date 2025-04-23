
## What Disks are.

A disk in computing refers to a storage device that is used to store data, typically in the form of magnetic, optical, or solid-state media. In Linux and other operating systems, a disk usually refers to a physical drive, such as a hard disk drive (HDD), solid-state drive (SSD), or even external drives. Disks are divided into partitions which are logical divisions used to organize the data. These partitions can each be formatted with different file systems (like ext4, NTFS, or FAT32) to manage how data is stored and accessed. Disks serve as the primary storage medium for operating systems, applications, and user data.

### 1. `lsblk`

List information about block devices.

```shell
joel@server-santander-linux:~$ lsblk
NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda                         8:0    0   25G  0 disk 
├─sda1                      8:1    0    1M  0 part 
├─sda2                      8:2    0    2G  0 part /boot
└─sda3                      8:3    0   23G  0 part 
  └─ubuntu--vg-ubuntu--lv 252:0    0 11.5G  0 lvm  /
sr0                        11:0    1 1024M  0 rom  
```

- In **Linux**, each physical disk gets a name that **starts with "sd"**:
    
    - Examples: `sda`, `sdb`, `sdc`...
        
    - The letter (`a`, `b`, `c`) changes for each disk.
        
- **Each partition on a disk is numbered**:
    
    - For example, disk `sda` can have partitions like `sda1`, `sda2`, `sda3`...
        
    - Disk `sdb` can have `sdb1`, `sdb2`, and so on.

### 2. `fdisk -l`

This lists all available partitions on all disks.

```shell
joel@server-santander-linux:~$ sudo fdisk -l
[sudo] password for joel: 
Disk /dev/sda: 25 GiB, 26843545600 bytes, 52428800 sectors
Disk model: VBOX HARDDISK   
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 07111033-EBC4-4268-AE6A-F1219708B083

Device       Start      End  Sectors Size Type
/dev/sda1     2048     4095     2048   1M BIOS boot
/dev/sda2     4096  4198399  4194304   2G Linux filesystem
/dev/sda3  4198400 52426751 48228352  23G Linux filesystem
....
```

### 3. `fdisk device`

This opens the **interactive mode** of `fdisk` for a device (e.g., `fdisk /dev/sdb`.)

```shell
joel@server-santander-linux:~$ sudo fdisk /dev/sdb

Welcome to fdisk (util-linux 2.39.3).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table.
Created a new DOS (MBR) disklabel with disk identifier 0xa6fcbd7e.
```

You’ll see a prompt like this:

`Command (m for help):`

From there, you can enter commands such as:

- `m` — Help
    
- `p` — Print the current partition table
    
- `n` — Add a new partition
    
- `d` — Delete a partition
    
- `t` — Change a partition's type
    
- `a` — Toggle the bootable flag
    
- `w` — Write changes and exit
    
- `q` — Quit without saving
    
#### Important:

- Any changes (like creating or deleting partitions) are **not applied** until you write them with `w`.
    
- Be very careful, using this tool on the wrong disk can lead to data loss.

### 4. `mkfs.ext4 device (e.g.,/dev/sdb)` or `mkfs.ext3 device (e.g.,/dev/sdb)`

It's important to format the new partition and define its file system. (Be careful, if you format a disk with files, you'll lost everything).

```shell
root@server-santander-linux:/mnt# mkfs.ext4 /dev/sdb
mke2fs 1.47.0 (5-Feb-2023)
Found a dos partition table in /dev/sdb
Proceed anyway? (y,N) y
Creating filesystem with 1310720 4k blocks and 327680 inodes
Filesystem UUID: fe61ad90-7e78-47ba-af50-bb140729ad2e
Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376, 294912, 819200, 884736

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done 
```

### 5. `mount device (e.g.,/dev/sdb) /mnt/disk2

Now it's important to mount the disk. it is a good practice to use a `/mnt` directory to do this.
So I created a new directory called `disk2` inside the `/mnt` one.

```shell
root@server-santander-linux:/mnt# mount /dev/sdb /mnt/disk2
```

Everything I save in `mnt/disk2` will be saved in this new partition (disk).

### 6. `umount device (e.g.,/dev/sdb)`

Use this command to unmount the device. You won't lose your content. If you mount it again, they will be there.

```shell
root@server-santander-linux:/mnt# umount /dev/sdb
```

### 7. `nano /etc/fstab`

When you reboot your server you will need to mount you device again. And if you had a lot devices, will you need to mount everyone?

No if you add your device in this file (fstab).

```shell
[File System] [Mount Point] [File System Type] [Options] [Dump] [Pass]
```

Exemple:

```shell
/dev/sdb /mnt/disk2 ext4 defaults 0 0
```

---
## What a File System is.