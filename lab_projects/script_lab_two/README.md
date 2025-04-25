## Infrastructure as Code (IaC)

This script automates the installation of a web application on a Linux server.  It updates the system, installs Apache2 and unzip, downloads the application from a GitHub repository, extracts it, copies the files to the web server's document root, and then cleans up the temporary files.  The final result is a web application accessible through a web browser using the server's IP address.

> [!NOTE] Important
> Interface Name: The script uses enp0s3 to determine the server's IP address. This interface name *might* be different on your system. You should verify the correct interface name and adjust the script if necessary.