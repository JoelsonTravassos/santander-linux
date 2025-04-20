## What is a package manager?

A _package manager_ keeps track of what software is installed on your computer, and allows you to easily install new software, upgrade software to newer versions, or remove software that you previously installed. As the name suggests, package managers deal with _packages_: collections of files that are bundled together and can be installed and removed as a group.
[read more](https://www.debian.org/doc/manuals/aptitude/pr01s02.en.html)

---
## Package managers (Debian and Ubuntu distributions)

For distributions based on Ubuntu and Debian you can use the same command.
### Apt-Get

apt-get is a command line interface for retrieval of packages
and information about them from authenticated sources and
for installation, upgrade and removal of packages together
with their dependencies.

#### 1. `apt-get --help`

Use this command to get help

```shell
joel@server-santander-linux:/scripts$ apt-get --help
apt 2.7.14 (amd64)
Usage: apt-get [options] command
       apt-get [options] install|remove pkg1 [pkg2 ...]
       apt-get [options] source pkg1 [pkg2 ...]
...
```

#### 2. `apt-get update`

It retrieves new lists of packages
   
```shell
joel@server-santander-linux:/scripts$ sudo apt-get update
[sudo] password for joel: 
Hit:1 http://br.archive.ubuntu.com/ubuntu noble InRelease
Get:2 http://br.archive.ubuntu.com/ubuntu noble-updates InRelease [126 kB]
Hit:3 http://br.archive.ubuntu.com/ubuntu noble-backports InRelease    
Hit:4 http://security.ubuntu.com/ubuntu noble-security InRelease
Fetched 126 kB in 2s (57.4 kB/s)                     
Reading package lists... Done
```

#### 3 `apt-get upgrade`

It Performs an upgrade

---
### Apt

apt is a commandline package manager and provides commands for
searching and managing as well as querying information about packages.
It provides the same functionality as the specialized APT tools,
like apt-get and apt-cache, but enables options more suitable for
interactive use by default.

#### 1. `apt --help`

Use this command to get help

```shell
joel@server-santander-linux:/scripts$ apt --help
apt 2.7.14 (amd64)
Usage: apt [options] command
...
```

#### 2. `apt list

list packages based on package names

```shell
joel@server-santander-linux:/scripts$ apt list
Listing... Done
0ad-data-common/noble 0.0.26-1 all
0ad-data/noble 0.0.26-1 all
0install-core/noble 2.18-2ubuntu2 amd64
0install/noble 2.18-2ubuntu2 amd64
0xffff/noble 0.9-1 amd64
1oom/noble 1.8.0-1build2 amd64
...
```
#### 3. `apt search`

It searches in package descriptions

```shell
joel@server-santander-linux:/scripts$ apt search apache
Sorting... Done
Full Text Search... Done
activemq/noble 5.17.6+dfsg-1 all
Java message broker - server
...
```

---
## Package managers (Fedora, Red hat and CenTOS)

### yum

**YUM** (Yellowdog Updater, Modified) was the default package manager for Red Hat-based systems before DNF came along. It handles package installation, removal, and updates using RPM packages, and resolves dependencies from configured repositories. While widely used for years, YUM had some performance and dependency resolution issues, which led to the development of DNF. As of RHEL 8 and newer, YUM is actually just a symbolic link to DNF for backward compatibility, so running `yum` under the hood now uses DNF.

#### 1. `yum --help`

Use this command to get help

```shell
[redhat@localhost ~]$ yum --help

Usage: yum [options] COMMAND

List of Commands:
```

---
### dnf

**DNF** (Dandified YUM) is the modern package manager used in Red Hat-based distributions like Fedora, RHEL 8+, and CentOS 8+. It was introduced to resolve many of the limitations found in YUM. DNF uses `libsolv` for faster and more accurate dependency resolution, has better performance, and offers a more consistent API for scripting and plugin development. It’s designed to be backward-compatible with YUM commands, so most users won’t notice a major difference unless they're digging into advanced functionality or scripting.

#### 1. `dnf --help`

Use this command to get help

```shell
[redhat@localhost ~]$ dnf --help

usage: dnf [options] <command> [args]

CLI tool for managing packages
...
```