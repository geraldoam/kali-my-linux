#!/usr/bin/ruby

require 'colorize'
require 'tty-prompt'
require 'rubygems'

def remove_repository

	def user_accept_remove
		system("clear && sed -i '/kali/d' /etc/apt/sources.list && sed -i '/Kali/d' /etc/apt/sources.list")
		puts "Removed."
		exit
	end

	remove_prompt = TTY::Prompt.new
	remove_confirmation = remove_prompt.select('Do you want to remove Kali repository?'.magenta) do |menu|
		menu.choice 'Yes'.green, 1
		menu.choice 'No'.red, 2
	end

	remove_confirmation == 1 ? user_accept_remove : exit
end

def select_tools
	system("clear")

	def install_tools(type)

		tools_all = File.read("tools/web.txt").split
		tools_exploration = File.read("tools/exploration_tools.txt").split
		tools_forensics = File.read("tools/forensics_tools.txt").split
		tools_hardware = File.read("tools/hardware_hacking.txt").split
		tools_infoget = File.read("tools/info_gethering.txt").split
		tools_maintaining = File.read("tools/maintaining_acess.txt").split
		tools_password = File.read("tools/password_atacks.txt").split
		tools_reporting = File.read("tools/reporting_tools.txt").split
		tools_reverse = File.read("tools/reverse_engineering.txt").split
		tools_sniffing = File.read("tools/sniffing_and_spoofing.txt").split
		tools_stress = File.read("tools/stress_testing.txt").split
		tools_vul = File.read("tools/vul_analysis.txt").split
		tools_web = File.read("tools/web.txt").split
		tools_wireless = File.read("tools/wireless_atack.txt").split
	
		def install_tools_command(type)
			system("sudo apt-get install #{type.join}")
		end
	
		case type
		when 1
			install_tools_command(tools_all)
		when 2
			install_tools_command(tools_exploration)
		when 3
			install_tools_command(tools_forensics)
		when 4
			install_tools_command(tools_hardware)
		when 5
			install_tools_command(tools_infoget)
		when 6
			install_tools_command(tools_maintaining)
		when 7
			install_tools_command(tools_password)
		when 8
			install_tools_command(tools_reporting)
		when 9
			install_tools_command(tools_reverse)
		when 10
			install_tools_command(tools_sniffing)
		when 11
			install_tools_command(tools_stress)
		when 12
			install_tools_command(tools_vul)
		when 13
			install_tools_command(tools_web)
		when 14
			install_tools_command(tools_wireless)
		else
			system("clear")
			puts "Invalid argument. Try again!"
			exit		
		end
	end

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

	install_tools(tools_category)
end

def detection_os
	system("clear")

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
		select_tools()
	when 3
		remove_repository()
	when 4
		exit
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
	
	options_menu(menu_choice)
end

begin
	gem 'colorize'
	gem 'tty-prompt'
rescue Gem::LoadError
	Gem.install('colorize')
	Gem.install('tty-prompt')
	gem 'colorize'
	gem 'tty-prompt'
end

begin
	inicial_menu()
rescue => e
	puts e
	exit
end