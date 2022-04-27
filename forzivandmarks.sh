#!/bin/bash
echo "Installing .net and Visual Studio Code"
echo "Installing Visual Studio Code"
wget https://dl.dropboxusercontent.com/s/c79sanlgb98g4fp/code_1.66.2-1649664567_amd64.deb > /dev/null
sudo apt-get update > /dev/null
sudo apt-get install -y gnome-keyring > /dev/null
sudo dpkg -i code_1.66.2-1649664567_amd64.deb
rm code_1.66.2-1649664567_amd64.deb > /dev/null
echo "Done Installing Visual Studio Code"
echo "



"
echo "Installing .net"
wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb > /dev/null
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb > /dev/null
sudo apt-get update; > /dev/null
sudo apt-get install -y apt-transport-https && sudo apt-get update && sudo apt-get install -y dotnet-sdk-5.0 && sudo apt-get install -y dotnet-sdk-3.1 > /dev/null
mkdir Computers && cd Computers > /dev/null
mkdir Clone && cd Clone > /dev/null
dotnet new console > /dev/null
cd ../.. > /dev/null
echo "For making a new rep make sure to copy and paste the 'Clone' folder"
echo "When Done Changeing execute: 'dotnet build'"
echo "Done!"
