#!/bin/bash

# GalliumOS Renewed's Wayland Installer Script
echo "Welcome to the Wayland Installer."
echo "Please select a desktop environment/window manager you would like to install from the following list:"
echo "1. KDE Plasma"
echo "2. GNOME"
echo "3. Sway"
echo "4. Weston"
read dewm
if [ $dewm == "1" ]; then
	echo "Installing KDE Plasma..."
	sudo apt install kubuntu-desktop
elif [ $dewm == "2" ]; then
	echo "Installing GNOME..."
	sudo apt install gnome
elif [ $dewm == "3" ]; then
	echo "Installing Sway..."
	sudo add-apt-repository ppa:samoilov-lex/sway
	sudo apt update
	sudo apt install sway
elif [ $dewm == "4" ]; then
	echo "Installing Weston..."
	sudo apt install weston
else
	echo "Invalid option!"
	exit
fi	
echo "All tasks completed!"

