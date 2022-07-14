# GalliumOS Renewed Main Install Script
echo "Attempting to perform upgrades..."
sudo apt upgrade
echo "Installing Linux kernel v5.10.25 and the fish shell..."
echo "Please enter your password in the following screen if requested to do so."
sudo apt install --install-recommends fish
curl -LO https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.25/amd64/linux-headers-5.10.25-051025_5.10.25-051025.202103201033_all.deb && sudo dpkg -i linux-headers-5.10.25-051025_5.10.25-051025.202103201033_all.deb
curl -LO https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.25/amd64/linux-image-unsigned-5.10.25-051025-generic_5.10.25-051025.202103201033_amd64.deb
curl -LO https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.10.25/amd64/linux-modules-5.10.25-051025-generic_5.10.25-051025.202103201033_amd64.deb
sudo dpkg -i linux-modules-5.10.25-051025-generic_5.10.25-051025.202103201033_amd64.deb linux-image-unsigned-5.10.25-051025-generic_5.10.25-051025.202103201033_amd64.deb
echo "Would you like me to remove the linux kernel .deb packages left over?"
read ynrt
if [ $ynrt == "y" ]; then
	rm -rf *.deb
elif [ $ynrt == "n" ]; then
	echo "[INFO] User chose not to remove leftovers."
else
	echo "Invalid input. Defaulting to no."
fi
echo "We now request you to edit your .bashrc to launch into fish upon running bash."
echo "Press any key to continue."
read
nano ~/.bashrc
echo "You will now be given the choice to edit your fish configuration. (y/n)"
read choice
if [ $choice == "y" ]; then
	nano ~/.config/fish/*
	nano ~/.config/fish/functions/*
elif [ $choice == "n" ]; then
	echo "[INFO] User chose not to edit fish config."
else
	echo "Invalid option. Defaulting to yes."
	nano ~/.config/fish/*
	nano ~/.config/fish/functions/*
fi
echo "Would you like to install any desktop environments or window managers? If so, please type the package name of one, or you can type no."
read installadewm
if [ $installadewm == "no" ]; then
	echo "[INFO] User chose not to install a desktop environment or window manager."
else
	echo "Attempting to install package..."
	sudo apt install $installadewm
fi
echo "Would you like to enable the built-in dark mode theme? (y/n)"
read darkyn
if [ $darkyn == "y" ]; then
	echo "Setting XFCE4 theme to Arc-Dark-GalliumOS..."
	xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-Dark-GalliumOS"
	echo "Setting XFWM4 theme to Arc-Dark-GalliumOS..."
	xfconf-query -c xfwm4 -p /general/theme -s "Arc-Dark-GalliumOS"
	echo "Finished setting theme to Dark."
elif [ $darkyn == "n" ]; then
	echo "[INFO] User chose not to set theme to Dark."
else
	echo "Invalid input."
fi
echo "Installing MrChromebox Firmware Utility Script at /usr/bin/cbfwutil..."
cd; curl -LO mrchromebox.tech/firmware-util.sh && sudo mv firmware-util.sh /usr/bin/cbfwutil && sudo chmod +x /usr/bin/cbfwutil
echo "Installing \e[36mGalliumOS Renewed\e[0m scripts..."
curl -LO https://raw.githubusercontent.com/EnterTheVoid-x86/GalliumOS-Renewed/main/2-themechanger.sh && sudo mv 2-themechanger.sh /usr/bin/themeify && sudo chmod +x /usr/bin/themeify
echo "[INSTALLED] Themeify installed successfully."
curl -LO https://raw.githubusercontent.com/EnterTheVoid-x86/GalliumOS-Renewed/main/3-installwayland.sh && sudo mv 3-installwayland.sh /usr/bin/installwayland && sudo chmod +x /usr/bin/installwayland
echo "[INSTALLED] Wayland Installer installed successfully."
echo "Installing emoji fonts..."
sudo apt install fonts-noto-color-emoji
echo "Would you like to install a code editor? (y/n)"
read codeeditor
if [ $codeeditor == "y" ]; then
	echo "Please choose a code editor from the following list:"
	echo "1. Visual Studio Code"
	echo "2. Sublime Text"
	echo "3. Atom"
	echo "4. Neovim"
	read codeeditorchoice
	if [ $codeeditorchoice == "1" ]; then
		echo "Installing Visual Studio Code..."
		sudo apt install gnupg2 software-properties-common apt-transport-https wget
		wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
		sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
		sudo apt update
		sudo apt install code
	elif [ $codeeditorchoice == "2" ]; then
		echo "Installing Sublime Text..."
		sudo apt install apt-transport-https ca-certificates curl software-properties-common
		curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
		sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
		sudo apt update
		sudo apt install sublime-text
	elif [ $codeeditorchoice == "3" ]; then
		echo "Installing Atom..."
		sudo apt install software-properties-common apt-transport-https wget
		wget -q https://packagecloud.io/AtomEditor/atom/gpgkey -O- | sudo apt-key add -
		sudo add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"
		sudo apt update
		sudo apt install atom
	elif [ $codeeditorchoice == "4" ]; then
		echo "Installing Neovim..."
		sudo apt install neovim
	else
		echo "Invalid input. Defaulting to Neovim..."
		sudo apt install neovim
	fi
elif [ $codeeditor == "n" ]; then
	echo "[INFO] User chose not to install a code editor."
else
	echo "Invalid input. Defaulting to no."
fi			
echo -e "\e[36mGalliumOS Renewed\e[0m is now installed. Please reboot your computer now to apply the full changes."


