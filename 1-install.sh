# GalliumOS Renewed Main Install Script
echo "Installing Linux kernel v5.4.0-122..."
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
echo -e "\e[36mGalliumOS Renewed is now installed. Please reboot your computer now to apply the full changes."


