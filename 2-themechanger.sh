#!/bin/bash

# GalliumOS Renewed's XFCE4 Themeify script

echo -e "Welcome to \e[31mThe\e[32mme\e[34mify\e[0m v1.0."
echo "Please select a theme from the following list:"
echo "1. Adwaita"
echo "2. Adwaita-dark"
echo "3. Arc-Darker-GalliumOS"
echo "4. Arc-Dark-GalliumOS"
echo "5. Arc-GalliumOS"
echo "6. Greybird"
echo "7. High Contrast"
echo "8. Numix"
echo "9. Raleigh"
read themechoice
if [ $themechoice == "1" ]; then
	echo "Changing theme to Adwaita."
	xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita"
	xfconf-query -c xfwm4 -p /general/theme -s "Adwaita"
elif [ $themechoice == "2" ]; then
	echo "Changing theme to Adwaita-dark."
	xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
        xfconf-query -c xfwm4 -p /general/theme -s "Adwaita-dark"
elif [ $themechoice == "3" ]; then
	echo "Changing theme to Arc-Darker-GalliumOS."
	xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-Darker-GalliumOS"
        xfconf-query -c xfwm4 -p /general/theme -s "Arc-Darker-GalliumOS" 
elif [ $themechoice == "4" ]; then
	echo "Changing theme to Arc-Dark-GalliumOS."
	xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-Dark-GalliumOS"
        xfconf-query -c xfwm4 -p /general/theme -s "Arc-Dark-GalliumOS" 
elif [ $themechoice == "5" ]; then
	echo "Changing theme to Arc-GalliumOS."
	xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-GalliumOS"
        xfconf-query -c xfwm4 -p /general/theme -s "Arc-GalliumOS" 
elif [ $themechoice == "6" ]; then
	echo "Changing theme to Greybird."
	xfconf-query -c xsettings -p /Net/ThemeName -s "Greybird"
        xfconf-query -c xfwm4 -p /general/theme -s "Greybird"
elif [ $themechoice == "7" ]; then
	echo "Changing theme to High Contrast."
	xfconf-query -c xsettings -p /Net/ThemeName -s "High Contrast"
        xfconf-query -c xfwm4 -p /general/theme -s "High Contrast" 
elif [ $themechoice == "8" ]; then
	echo "Changing theme to Numix."
	xfconf-query -c xsettings -p /Net/ThemeName -s "Numix"
        xfconf-query -c xfwm4 -p /general/theme -s "Numix" 
elif [ $themechoice == "9" ]; then
	echo "Changing theme to Raleigh."
	xfconf-query -c xsettings -p /Net/ThemeName -s "Raleigh"
        xfconf-query -c xfwm4 -p /general/theme -s "Raleigh" 
else
	echo "Invalid option!"
	exit
fi
echo "Theme successfully changed."
