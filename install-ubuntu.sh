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
# sudo cp -r kml /opt/;
# sudo ln -sf /opt/kml/kml.rb /usr/bin/kml;
# kml
echo '#!/bin/bash' >> run.sh;
echo 'ruby kml/kml.rb' >> run.sh;
chmod +x run.sh;
./run.sh