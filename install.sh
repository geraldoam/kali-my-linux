#!/bin/bash
clear
printf "\e[36m



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

printf "\e[0mPlease, select your distribution to install script. Put the \e[1mnumber\e[0m."
echo && echo
printf "\e[36m[1]\e[0m Debian, Ubuntu, Linux Mint, Zorin OS."
echo 
printf "\e[36m[2]\e[0m Arch Linux, Manjaro."
echo
printf "\e[36m> \e[39m"
read USER_DISTRIBUTION

if [ $USER_DISTRIBUTION = 1 ]; then
	sudo apt-get install ruby
      sudo cp kml /opt/
      sudo ln -sf /opt/kml/kml.rb /usr/bin/kml
      kml
else
      YAY_EXIST='pacman -Qi yay'
      sudo pacman -S ruby
      if [ -n "$YAY_EXIST" ]; then
            sudo pacman -S git
            git clone https://aur.archlinux.org/yay.git && sudo chown $USER -R yay/ && cd yay && makepkg -si 
            cd ..
            sudo cp kml /opt/
            sudo ln -sf /opt/kml/kml.rb /usr/bin/kml
            sudo ruby /opt/kml/kml.rb
      fi
fi