#!/bin/bash

#######################################################
#	Detect OS
#######################################################
function detectionOS(){
	cmd=(dialog --keep-tite --menu "Choose your OS:" 16 50 13)

	options=(1 "Debian"
	         2 "Ubuntu"
	         3 "Zorin OS"
	         4 "Linux Mint"
	         5 "Arch Linux"
	         6 "Manjaro")

	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

	for choice in $choices
	do
	    case $choice in
	        1)
				userDistro=$"Debian"
	            ;;
	        2)
				userDistro=$"Debian"       
	            ;;
	        3)
				userDistro=$"Debian"	
	            ;;
	        4)
				userDistro=$"Debian"		
	            ;;
	        5)
				userDistro=$"Arch" 
	            ;;
	        6)
				userDistro=$"Arch"			
	            ;;  	                        	            
	        *)
				initialScript
				optionsMenu
				;;
	    esac
	done	
}

#######################################################
#	Add Repository
#######################################################
function addRepository(){
	## Call detectionOS function
	detectionOS

	if [[ "$userDistro" == "Debian" ]]; then
		clear

		alertMensage=$(echo -e "Alert:

		Don't run apt-get upgrade after install. 

		Remove the repository after install tools.")
		dialog --msgbox "$alertMensage" 12 30

		apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6
		echo '# Kali Repository (kali-my-linux)' >> /etc/apt/sources.list
		echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
		apt-get update -m

		echo
		echo "Wait..."
		sleep 5
	else
		clear
		echo "You don't need to install repository, you will use AUR to get packages."
		echo "Wait..."
		sleep 5
	fi

	initialScript
	optionsMenu	
}

#######################################################
#	Menu Tool Install
#######################################################
function toolInstall(){

	## Call detectionOS function
	detectionOS

	cmd=(dialog --keep-tite --menu "Choose one:" 21 50 13)

	options=(1 "Information Gathering"
	         2 "Vulnerability Analysis"
	         3 "Wireless Attacks"
	         4 "Web Applications"
	         5 "Sniffing & Spoofing"
	         6 "Maintaining Access" 
	         7 "Reporting Tools"
	         8 "Exploitation Tools"
	         9 "Forensics Tools"
	         10 "Stress Testing"
	         11 "Password Attacks"
	         12 "Reverse Engineering"
	         13 "Hardware Hacking"
	         14 "Install All Tools.")

	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

	if [[ "$userDistro" == "Debian" ]]; then
		for choice in $choices
			do
			    case $choice in
			        1)
						APPS=$(cat tools/info_gethering.txt)
			            ;;
			        2)
						APPS=$(cat tools/vul_analysis.txt)
			            ;;
			        3)
						APPS=$(cat tools/wireless_atack.txt)
			            ;;
			        4)
						APPS=$(cat tools/web.txt)
			            ;;
			        5)
						APPS=$(cat tools/sniffing_and_spoofing.txt)
			            ;;
			        6)
						APPS=$(cat tools/maintaining_acess.txt)
			            ;;
			        7)
						APPS=$(cat tools/reporting_tools.txt)
			            ;;
			        8)
						APPS=$(cat tools/exploration_tools.txt)
			            ;;
			        9)
						APPS=$(cat tools/forensics_tools.txt)
			            ;;
			        10)
						APPS=$(cat tools/stress_testing.txt)
			            ;;
			        11)
						APPS=$(cat tools/password_atacks.txt)
			            ;;
			        12)
						APPS=$(cat tools/reverse_engineering.txt)
			            ;;
			        13)
						APPS=$(cat tools/hardware_hacking.txt)
			            ;;
			        14)
						APPS=$(cat tools/all.txt)
			            ;;		            	            
			        *)
						initialScript
						;;
			    esac
			done

			sudo apt-get install $APPS
			
	else
		for choice in $choices
			do
			    case $choice in
			        1)
						APPS=$(cat tools/info_gethering.txt) && yay -S $APPS
			            ;;
			        2)
						APPS=$(cat tools/vul_analysis.txt) && yay -S $APPS
			            ;;
			        3)
						APPS=$(cat tools/wireless_atack.txt) && yay -S $APPS
			            ;;
			        4)
						APPS=$(cat tools/web.txt) && yay -S $APPS
			            ;;
			        5)
						APPS=$(cat tools/sniffing_and_spoofing.txt) && yay -S $APPS
			            ;;
			        6)
						APPS=$(cat tools/maintaining_acess.txt) && yay -S $APPS
			            ;;
			        7)
						APPS=$(cat tools/reporting_tools.txt) && yay -S $APPS
			            ;;
			        8)
						APPS=$(cat tools/exploration_tools.txt) && yay -S $APPS
			            ;;
			        9)
						APPS=$(cat tools/forensics_tools.txt) && yay -S $APPS
			            ;;
			        10)
						APPS=$(cat tools/stress_testing.txt) && yay -S $APPS
			            ;;
			        11)
						APPS=$(cat tools/password_atacks.txt) && yay -S $APPS
			            ;;
			        12)
						APPS=$(cat tools/reverse_engineering.txt) && yay -S $APPS
			            ;;
			        13)
						APPS=$(cat tools/hardware_hacking.txt) && yay -S $APPS
			            ;;
			        14)
						APPS=$(cat tools/all.txt) && yay -S $APPS
			            ;;		            	            
			        *)
						initialScript
						;;
			    esac
			done

			yay -S $APPS	

	fi

}

#######################################################
#	Removing Repository
#######################################################
function removeRepository(){
	clear
	sed -i '/kali/d' /etc/apt/sources.list && sed -i '/Kali/d' /etc/apt/sources.list
	echo
	echo "All right. Wait..."
	sleep 4
	exit
}

#######################################################
#	Start Script
#######################################################
function initialScript(){

COLUMNS=$(tput cols) 
title=$(echo -e "\e[1m\e[96m


			 ██ ▄█▀    ███▄ ▄███▓    ██▓    
			 ██▄█▒    ▓██▒▀█▀ ██▒   ▓██▒    
			▓███▄░    ▓██    ▓██░   ▒██░    
			▓██ █▄    ▒██    ▒██    ▒██░    
			▒██▒ █▄   ▒██▒   ░██▒   ░██████▒
			▒ ▒▒ ▓▒   ░ ▒░   ░  ░   ░ ▒░▓  ░
			░ ░▒ ▒░   ░  ░      ░   ░ ░ ▒  ░
			░ ░░ ░    ░      ░        ░ ░   
			░  ░             ░          ░  ░
			                                
\e[39m")
clear
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title"


echo
echo -e "    \e[36m[1]\e[39m Add repository."
echo -e "    \e[36m[2]\e[39m Install tools."
echo -e "    \e[36m[3]\e[39m Remove repository."
echo -e "    \e[36m[4]\e[39m Exit."
echo

printf "\e[36m    > \e[39m"
read OPTION
return $OPTION
}

#######################################################
#	Menu Script Select
#######################################################
function optionsMenu(){
	case $OPTION in
		1 )
			clear
			dialog --yesno 'Do you want to install Kali repository?' 8 30
			if [[ $? = 0 ]]; then
				addRepository
			else
				clear
				initialScript
				optionsMenu
			fi
			;;
		2 )
			clear	
			toolInstall
			;;
		3 )
			clear
			dialog --yesno 'Do you want to remove Kali repository?' 8 30
			if [[ $? = 0 ]]; then
				removeRepository
			else
				clear
				initialScript
				optionsMenu
			fi			
			sleep 3
			;;
		4 )
			clear
			echo "Exit."
			sleep 3
			exit
			;;
		* )
			echo "I can't read it, try again..."
			sleep 3
			initialScript
			optionsMenu
			;;
	esac
}


#######################################################
#	Init
#######################################################
initialScript
optionsMenu
