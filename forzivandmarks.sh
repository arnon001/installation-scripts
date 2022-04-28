#!/bin/bash
echo "Installing .net and Visual Studio Code"
echo "Installing Visual Studio Code"
wget https://dl.dropboxusercontent.com/s/c79sanlgb98g4fp/code_1.66.2-1649664567_amd64.deb 2> /dev/null
sudo apt-get update 2> /dev/null
sudo apt-get install -y gnome-keyring 2> /dev/null
sudo dpkg -i code_1.66.2-1649664567_amd64.deb 2> /dev/null
rm code_1.66.2-1649664567_amd64.deb 2> /dev/null
echo "Done Installing Visual Studio Code"
echo "



"
echo "Installing .net"
wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb 2> /dev/null
sudo dpkg -i packages-microsoft-prod.deb 2> /dev/null
rm packages-microsoft-prod.deb 2> /dev/null
sudo apt-get update; 2> /dev/null
sudo apt-get install -y apt-transport-https && sudo apt-get update && sudo apt-get install -y dotnet-sdk-5.0 2> /dev/null
mkdir Computers && cd Computers 2> /dev/null
mkdir Clone && cd Clone 2> /dev/null
dotnet new console 2> /dev/null
cd ../.. 2> /dev/null
echo "For making a new rep make sure to copy and paste the 'Clone' folder"
echo "When Done Changeing execute: 'dotnet build'"
echo "Done!"
