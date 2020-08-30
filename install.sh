#!/bin/bash
clear
echo "\e[36m



        ██ ▄█▀    ███▄ ▄███▓    ██▓    
        ██▄█▒    ▓██▒▀█▀ ██▒   ▓██▒    
        ▓███▄░    ▓██    ▓██░   ▒██░    
        ▓██ █▄    ▒██    ▒██    ▒██░    
        ▒██▒ █▄   ▒██▒   ░██▒   ░██████▒
        ▒ ▒▒ ▓▒   ░ ▒░   ░  ░   ░ ▒░▓  ░
        ░ ░▒ ▒░   ░  ░      ░   ░ ░ ▒  ░
        ░ ░░ ░    ░      ░        ░ ░   
        ░  ░             ░          ░  ░                                     
        
              \e[0mgithub: gerald0x01
"

echo "\e[0mPlease, select your distribution to install script. Put the number.\n"
echo "\e[36m[1]\e[0m Debian, Ubuntu, Linux Mint, Zorin OS."
echo "\e[36m[2]\e[0m Arch Linux, Manjaro."
printf "\e[36m> \e[39m"
read USER_DISTRIBUTION

if [[ $USER_DISTRIBUTION == 1 ]]; then
	sudo apt-get install ruby
      sudo mv kml /opt/
      sudo ln -sf /opt/kml/kml.rb /usr/bin/kml
else
      sudo pacman -S ruby
      if [ pacman -Qi yay == 0]; then
            sudo pacman -S git
            git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
            sudo mv kml /opt/
            sudo ln -sf /opt/kml/kml.rb /usr/bin/kml
      fi
fi