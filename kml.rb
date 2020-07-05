#!/usr/bin/ruby

require 'colorize'
require 'tty-prompt'

def detectionOS
	system("clear")

	prompt = TTY::Prompt.new
	osChoice = 	prompt.select('Choose your based distribution:'.magenta) do |menu|
					menu.choice 'Debian'.blue, 1
					menu.choice 'Zorin OS'.blue, 2
					menu.choice 'Linux Mint'.blue, 3
					menu.choice 'Ubuntu'.blue, 4
					menu.choice 'Manjaro'.blue, 5
					menu.choice 'Arch Linux'.blue, 6
				  end
	
	if osChoice > 0 and osChoice <= 4
		# Debian based code
	elsif osChoice >= 5 and osChoice <= 6
		# Arch based code
	else
		system("clear")
		puts "Invalid argument. Try again!"
		exit
	end
end

def inicialMenu
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

	prompt = TTY::Prompt.new
	menuChoice = 	prompt.select("Kali my Linux | @i686leak\n".white) do |menu|
						menu.choice 'Add Repository.'.cyan, 1
						menu.choice 'Install tools.'.cyan, 2
						menu.choice 'Remove Repository.'.cyan, 3
						menu.choice 'Exit.'.cyan, 4
					end	
end

inicialMenu
detectionOS