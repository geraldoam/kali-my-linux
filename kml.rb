#!/usr/bin/ruby

require 'colorize'
require 'tty-prompt'

def install_tools
	system("clear")

	tools_prompt = TTY::Prompt.new
	tools_category = tools_prompt.select('Choose category to install:'.magenta) do |menu|
		menu.choice "Information Gathering".green, 1
		menu.choice "Vulnerability Analysis".green, 2
		menu.choice "Wireless Attacks".green, 3
		menu.choice "Web Applications".green, 4
		menu.choice "Sniffing & Spoofing".green, 5
		menu.choice "Maintaining Access".green, 6
		menu.choice "Reporting Tools".green, 7
		menu.choice "Exploitation Tools".green, 8
		menu.choice "Forensics Tools".green, 9
		menu.choice "Stress Testing".green, 10
		menu.choice "Password Attacks".green, 11
		menu.choice "Reverse Engineering".green, 12
		menu.choice "Hardware Hacking".green, 13
		menu.choice "Install All Tools".red, 14
	end
end

def install_repository(type_distro)
	system("clear")

	repository_prompt = TTY::Prompt.new
	repository_confirmation = repository_prompt.select('Do you want to install Kali repository?'.magenta) do |menu|
		menu.choice 'Yes'.green, 1
		menu.choice 'No'.red, 2
	end

	def user_accept_install(type_distro)
		if type_distro == "Debian"
			system("apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6 && echo '# Kali Repository (kali-my-linux)' >> /etc/apt/sources.list && echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && apt-get update -m")
		elsif type_distro == "Arch"
			system("clear")
			puts "You don't need to install repository. You will use AUR to get packages."
		else
			system("clear")
			puts "Invalid argument. Try again!"
			exit			
		end
	end

	repository_confirmation == 1 ? user_accept_install(type_distro) : exit
end

def detection_os
	system("clear")

	detection_prompt = TTY::Prompt.new
	os_choice = detection_prompt.select('Choose your based distribution:'.magenta) do |menu|
					menu.choice 'Debian'.blue, 1
					menu.choice 'Zorin OS'.blue, 2
					menu.choice 'Linux Mint'.blue, 3
					menu.choice 'Ubuntu'.blue, 4
					menu.choice 'Manjaro'.blue, 5
					menu.choice 'Arch Linux'.blue, 6
	end
	
	if os_choice > 0 and os_choice <= 4
		install_repository("Debian")
	elsif os_choice >= 5 and os_choice <= 6
		install_repository("Arch")
	else
		system("clear")
		puts "Invalid argument. Try again!"
		exit
	end
end

def options_menu(menu_choice)
	case menuChoice
	when 1
		detection_os()
	when 2
		# Install tools option.
	when 3
		# Remove repository.
	when 4
		
	else
		system("clear")
		puts "Invalid argument. Try again!"
		exit
	end
end

def inicial_menu
	print "

	██ ▄█▀    ███▄ ▄███▓    ██▓    
	██▄█▒    ▓██▒▀█▀ ██▒   ▓██▒    
	▓███▄░    ▓██    ▓██░   ▒██░    
	▓██ █▄    ▒██    ▒██    ▒██░    
	▒██▒ █▄   ▒██▒   ░██▒   ░██████▒
	▒ ▒▒ ▓▒   ░ ▒░   ░  ░   ░ ▒░▓  ░
	░ ░▒ ▒░   ░  ░      ░   ░ ░ ▒  ░
	░ ░░ ░    ░      ░        ░ ░   
	░  ░             ░          ░  ░
	
	".cyan

	inicial_prompt = TTY::Prompt.new
	menu_choice = 	inicial_prompt.select("Kali my Linux | @i686leak\n".white) do |menu|
						menu.choice 'Add Repository.'.cyan, 1
						menu.choice 'Install tools.'.cyan, 2
						menu.choice 'Remove Repository.'.cyan, 3
						menu.choice 'Exit.'.cyan, 4
	end
	
	return menu_choice
end

install_tools()