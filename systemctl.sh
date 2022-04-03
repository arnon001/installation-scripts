#!/bin/bash
lsb_release -a
echo ""
echo "insert your ubuntu version (only 18.04 and 20.04)"
read version
if ( $version == 20.04 || $version == 20) 
	then
		sudo apt install -y python2
		sudo mv /usr/bin/systemctl /usr/bin/systemctl.old
		curl https://raw.githubusercontent.com/arnon001/installation-scripts/main/systemctl.py >temp
		sudo mv temp /usr/bin/systemctl
		sudo chmod +x /usr/bin/systemctl
		clear
		echo "Done!, run systemctl to check"
	fi
if ( $version == 18.04 || $version == 18)
	then
		sudo apt install -y python-minimal
		sudo mv /usr/bin/systemctl /usr/bin/systemctl.old
		curl https://raw.githubusercontent.com/arnon001/installation-scripts/main/systemctl.py >temp
		sudo mv temp /usr/bin/systemctl
		sudo chmod +x /usr/bin/systemctl
		clear
		echo "Done!, run systemctl to check"
	fi
	
