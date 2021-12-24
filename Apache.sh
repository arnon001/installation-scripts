#!/bin/bash
clear
@echo off
echo "updating and installing Apache and git"
sudo apt update
sudo apt install Apache2
sudo apt install git
echo "Opening port and starting ufw"
sudo ufw enable
sudo ufw allow Apache
echo "Downloading Website files"
echo "Please enter your Domain Name:"
read dn
mkdir -p /var/www/$dn/
cd /var/www/$dn/
echo "Please enter your git repo:"
read git
git clone $git "html"
cd ~
echo "Doing Permissions"
sudo chown -R $USER:$USER /var/www/$dn/html
sudo chmod -R 755 /var/www/$dn
echo "Doing Some Apache Stuff"
cd /etc/apache2/sites-available/
echo "<VirtualHost *:80>
ServerAdmin admin@$dn
ServerName $dn
ServerAlias $dn
DocumentRoot /var/www/$dn/html
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > $dn.conf
sudo a2ensite $dn.conf
sudo a2dissite 000-default.conf
sudo systemctl restart apache2
cd /etc/apache2/conf-available/
echo "ServerName $dn" > servername.conf
sudo a2enconf servername
sudo systemctl restart apache2
sudo systemctl enable apache2
echo "Done!"
echo "Your Website is on $dn"
