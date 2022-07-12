#!/usr/bin/env bash
dist=$(tr -s ' \011' '\012' < /etc/issue | head -n 1)
echo -e "Welcome to the \e[36mGalliumOS Renewed\e[0m installer script."
echo "Checking if current linux distro is GalliumOS..."
if [ $dist == "GalliumOS" ]; then
	echo -e "\e[32m[+]\e[0m Script is running on GalliumOS"
else
	echo -e "\e[31m[ERR]\e[0m Script is not running on GalliumOS. Please use this script only with GalliumOS 3.1."
	exit
fi

echo "GalliumOS Renewed is a 'fork' of GalliumOS with an updated kernel, the fish shell, and other general bugfixes."
echo "It is still in beta, so some things may not work properly."
echo "By continuing you agree that damaged installs are not my fault, and no legal action can be taken."
echo "Are you sure you want to install? (y/n)"
read continue
if [ $continue == "y" ]; then
	echo "Installing GalliumOS Renewed..."
	./1-install.sh
elif [ $continue == "n" ]; then
	echo "Exiting the installer..."
	exit
else 
	echo "Invalid input."
	exit
fi
