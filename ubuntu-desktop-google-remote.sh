#!/bin/bash
clear
echo "Welcome to the installtion script for Ubuntu-desktop + Google Remote Desktop"
echo "for installtion of ubuntu-desktop + Google Remote Desktop, Select: 1"
echo "for installtion of Google Remote Desktop only (Must Have an Enviroment) Without Existing user, Select: 2"
echo "for installtion of Google Remote Desktop only (Must Have an enviroment) With existing user, Select: 3"
echo "for installation of ubuntu-desktop only, select 4"

read in
while( $in > 4 ) {
	echo "Invaild Option! please Rerun the script!"
	exit
}
while( $in < 1 ) {
	echo "Invaild Option! please Rerun the script!"
	exit
}
while($in == 1) {
	echo "Installing Ubuntu-desktop + Google remote desktop"
	sudo apt update
	sudo apt install tasksel -y
	sudo tasksel install ubuntu-desktop
	sudo wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
	sudo apt ./chrome-remote-desktop_current_amd64.deb
	sudo apt --fix-broken install
	echo "Creating User..."
	echo "Enter the user name:"
	read user 
	sudo adduser $user
	su $user
	echo "goto https://remotedesktop.google.com/headless and enter the Debian linux code:"
	read code
	echo "Please Choose a pin:"
	$code
	echo "Done!"
	echo "Make sure to reboot!"
	exit
}
while($in == 2){
	echo "Installing Google remote desktop"
	sudo apt update
	sudo wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
	sudo apt ./chrome-remote-desktop_current_amd64.deb
	sudo apt --fix-broken install
	echo "Creating User..."
	echo "Enter the user name:"
	read user 
	sudo adduser $user
	su $user
	echo "goto https://remotedesktop.google.com/headless and enter the Debian linux code:"
	read code
	echo "Please Choose a pin:"
	$code
	echo "Done!"
	exit
}
while($in == 3){
	echo "Installing Google remote desktop"
	sudo apt update
	sudo wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
	sudo apt ./chrome-remote-desktop_current_amd64.deb
	sudo apt --fix-broken install
	echo "Enter The Username:"
	read username
	su $user
	echo "goto https://remotedesktop.google.com/headless and enter the Debian linux code:"
	read code
	echo "Please Choose a pin:"
	$code
	echo "Done!"
	exit
}
while($in == 4){
	echo "Installing Ubuntu-desktop"
	sudo apt update
	sudo apt install tasksel -y
	sudo tasksel install ubuntu-desktop
	echo "Done!"
	echo "Please Reboot the VPS"
	exit
}
