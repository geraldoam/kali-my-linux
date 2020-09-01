#!/bin/sh
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
sudo apt-get install ruby;
sudo cp -r kml /opt/;
sudo ln -sf /opt/kml/kml.rb /usr/bin/kml;
kml