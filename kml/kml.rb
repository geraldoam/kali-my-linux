#!/usr/bin/ruby
require 'json'

def banner()
    system('clear')
    puts("\e[36m


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
    puts "\e[39mgithub: gerald0x01\n".center(50)
end

def select_option()
    banner()
    category_options = ["\e[36m[1]\e[39m Install repository.", "\e[36m[2]\e[39m Install tools.", "\e[36m[3]\e[39m Remove repository."]
    category_options.map {|option| puts option}
    print "\n\e[36m>\e[39m "; @user_option = gets; return @user_option.to_i
end

def select_distro()
    banner()
    category_distro = ["\e[36m[1]\e[39m Debian.", "\e[36m[2]\e[39m Ubuntu.", "\e[36m[3]\e[39m Linux Mint.", "\e[36m[4]\e[39m Arch Linux.\n", "\e[36m[5]\e[39m Manjaro.\n"]
    category_distro.map {|distro| puts distro}
    print "\n\e[36m>\e[39m "; @user_distro = gets; return @user_distro.to_i
end

def install(using_distro)
    def debian_based
        system("sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6 && echo '# Kali Repository (kali-my-linux)' >> /etc/apt/sources.list && echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && apt-get update -m")
    end

    def arch_based
        print "You don't need to install repository. You'll use AUR. (yay)"
    end

    using_distro == 'debian_based' ? debian_based() : arch_based()
end

def tools(using_distro)
    def category_install_tools(using_category, using_distro)
        myHash = {}
        Dir.glob('./tools/*.txt') do |category_name|
            category = File.basename(category_name, '.txt')
            myHash[category] = File.readlines(category_name).map(&:chomp)
        end
        using_distro == 'debian_based' ? system("sudo apt-get install #{myHash[using_category]}") : system("yay -S #{myHash[using_category]}")
    end

    banner()
    category_tools = [
        "\e[36m[1]\e[39m All.",
        "\e[36m[2]\e[39m Eploration.",
        "\e[36m[3]\e[39m Forensic.",
        "\e[36m[4]\e[39m Hardware.\n",
        "\e[36m[5]\e[39m Maintaining Acess.\n",
        "\e[36m[6]\e[39m Password Atacks.\n",
        "\e[36m[7]\e[39m Reporting Tools.\n",
        "\e[36m[8]\e[39m Reverse Engineering.\n",
        "\e[36m[9]\e[39m Sniffing and Spoofing.\n",
        "\e[36m[10]\e[39m Stress Testing.\n",
        "\e[36m[11]\e[39m Vul Analysis.\n",
        "\e[36m[12]\e[39m Web.\n",
        "\e[36m[13]\e[39m Wireless.\n"
    ]
    category_tools.map {|tools| puts tools}
    print "\n\e[36m>\e[39m "; category_number = gets

    json_category = {
        1 =>  'all',
        2 =>  'exploration_tools',
        3 =>  'forensics_tools',
        4 =>  'hardware_hacking',
        5 => 'info_gethering',
        6 => 'maintaining_acess',
        7 => 'reporting_tools',
        8 => 'reverse_engineering',
        9 => 'sniffing_and_spoofing',
        10 => 'stress_testing',
        11 => 'vul_analysis',
        12 => 'web',
        13 => 'wireless_atack'
    }

    category_install_tools(json_category[category_number], using_distro)
end

def uninstall(using_distro)
    def distro_uninstall
        def debian_based
            system("sudo clear && sed -i '/kali/d' /etc/apt/sources.list && sed -i '/Kali/d' /etc/apt/sources.list"); p("Removed.")
        end
        def arch_based
            print "You don't need to remove repository. You're using AUR. (yay)"
        end
    end
    using_distro == 'debian_based' ? debian_based() : arch_based()
end

def verification(option, distro)

    def actual_user_distro(distro)
        case distro
        when 1, 2, 3 then distro = 'debian_based'
        when 4, 5 then distro = 'arch_based'
        end
        return distro
    end

    def actual_user_option(option, using_distro)
        case option
        when 1 then install(using_distro)
        when 2 then tools(using_distro)
        when 3 then uninstall(using_distro)
        end
    end

    using_distro = actual_user_distro(distro)

    if [1, 2, 3, 4, 5].include?(distro)
        distro_based = actual_user_distro(distro)
    else
        puts "Wrong option. Type the number."
    end

    [1, 2, 3].include?(option) ? actual_user_option(option, using_distro) : exit
end

def main()
    @user_option = select_option(); @user_distro = select_distro()
    verification(@user_option, @user_distro)
end

main()