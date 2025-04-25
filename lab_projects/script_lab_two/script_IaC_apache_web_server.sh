#!/bin/bash

echo "Updating the server..."

apt update
apt upgrade -y

echo "Installing Apache2..."

apt install apache2 -y # Instaling the Web Server

echo "Installing Unzip..."

apt install unzip -y

echo "Downloading the aplication on /tmp directory..."

# It downloads the project and put it into /tmp directory
wget -P /tmp https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo "Unziping the aplication..."

# Extract the main.zip (linux-site-dio-main folder), and put it in /var/www/html/ directory
unzip /tmp/main.zip -d /var/www/html/

echo "Deleting the aplication zip file..."

rm -rf /tmp/main.zip

echo "Copying all the application files to the apache2 default directory..."

cp /var/www/html/linux-site-dio-main/* -r /var/www/html/

echo "Deleting the linux-site-dio-main folder..."

rm -rf /var/www/html/linux-site-dio-main

echo "All done!! Now you can access the web application in your browser using the following IP:"

ip -4 addr show enp0s3 | grep -oP '(?<=inet\s)\d+(\.\d+){3}' # Display the inet IP
