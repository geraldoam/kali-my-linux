#!/usr/bin/ruby

def banner()
    system('clear')
    puts("


        ██ ▄█▀    ███▄ ▄███▓    ██▓    
        ██▄█▒    ▓██▒▀█▀ ██▒   ▓██▒    
        ▓███▄░    ▓██    ▓██░   ▒██░    
        ▓██ █▄    ▒██    ▒██    ▒██░    
        ▒██▒ █▄   ▒██▒   ░██▒   ░██████▒
        ▒ ▒▒ ▓▒   ░ ▒░   ░  ░   ░ ▒░▓  ░
        ░ ░▒ ▒░   ░  ░      ░   ░ ░ ▒  ░
        ░ ░░ ░    ░      ░        ░ ░   
        ░  ░             ░          ░  ░                                     
        
    ")
    puts "github: gerald0x01\n".center(60)
end

def select_option()
    banner()
    category_options = ["\e[36m[1]\e[39m Install repository.", "\e[36m[2]\e[39m Install tools.", "\e[36m[3]\e[39m Remove repository.", "\e[36m[4]\e[39m Exit.\n"]
    category_options.map {|option| puts option}
    print "\n\e[36m>\e[39m "; @user_option = gets; return @user_option.to_i
end

def select_distro()
    banner()
    category_distro = ["\e[36m[1]\e[39m Debian.", "\e[36m[2]\e[39m Ubuntu.", "\e[36m[3]\e[39m Linux Mint.", "\e[36m[4]\e[39m Arch Linux.\n", "\e[36m[5]\e[39m Manjaro.\n"]
    category_distro.map {|distro| puts distro}
    print "\n\e[36m>\e[39m "; @user_distro = gets; return @user_distro.to_i
end

# def install_repository
#     def debian_based
#         system("sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6 && echo '# Kali Repository (kali-my-linux)' >> /etc/apt/sources.list && echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && apt-get update -m")
#     end

#     def arch_based
#         print "You don't need to install repository. You'll use AUR. (yay)"
#     end
#     # @debian_based_distros.include?($user_distribution) ? debian_based : arch_based
#     # @avaible_distro.include?($user_distribution) ? distro_install() : puts("Inavaible distribution, try again.\nTry: kml --help.")
# end

def verification(option, distro)

    def actual_user_distro(distro)
        case distro
        when 1, 2, 3 then $distro = 'debian_based'
        when 4, 5 then $distro = 'arch_based'
        end 
    end

    def actual_user_option(option)
        case option
        when 1 then # install(distro)
        when 2 then # tools(distro)
        when 3 then # uninstall(distro)
        when 4 then # exit
        end
    end

    [1, 2, 3, 4].include?(option) ? puts("option include") : puts("Wrong option. Type the number.")
    [1, 2, 3, 4, 5].include?(distro) ? puts("distro include") : puts("Wrong distro. Type the number.")

    actual_user_distro(distro)

end

def main()
    @user_option = select_option(); @user_distro = select_distro()
    verification(@user_option, @user_distro)
end

main()