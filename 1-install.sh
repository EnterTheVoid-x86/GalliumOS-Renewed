# GalliumOS Renewed Main Install Script
echo "Installing Linux kernel v5.4.0-122 and the fish shell..."
echo "Please enter your password in the following screen if requested to do so."
sudo apt install --install-recommends linux-generic-hwe-18.04 xserver-xorg-hwe-18.04 fish
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
echo -e "\e[36mGalliumOS Renewed\e[0m is now installed. Please reboot your computer now to apply the full changes."


