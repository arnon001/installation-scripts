#!/bin/bash
echo "Installing .net"
wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb 
rm packages-microsoft-prod.deb
sudo apt-get update; 
sudo apt-get install -y apt-transport-https && sudo apt-get update && sudo apt-get install -y dotnet-sdk-5.0
mkdir Computers && cd Computers 
mkdir Clone && cd Clone 
dotnet new console 
cd ../..
echo "For making a new rep make sure to copy and paste the 'Clone' folder"
echo "When Done Changeing execute: 'dotnet build'"
echo "Done!"
