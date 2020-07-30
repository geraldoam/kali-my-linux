#!/usr/bin/env ruby
require 'optparse'

@debian_based_distros = ['Debian', 'Ubuntu', 'Zorin', 'Mint']
@arch_based_distros = ['Arch', 'Manjaro']
@avaible_distro = @debian_based_distros + @arch_based_distros

def parser_distro(distro)
    @avaible_distro.include?(distro) ? p : puts("Inavaible distribution, try again.\nTry: kml --help."); return distro
end

def parser_distro_avaibles
    @avaible_distro.each {|avaible| p avaible}
end

def parser_uninstall
    def distro_uninstall
        def debian_based
            system("sudo clear && sed -i '/kali/d' /etc/apt/sources.list && sed -i '/Kali/d' /etc/apt/sources.list"); p("Removed.")
        end
        def arch_based
            print "You don't need to remove repository."
        end
        @debian_based_distros.include?($user_distribution) ? debian_based : arch_based
    end
    @avaible_distro.include?($user_distribution) ? distro_uninstall() : puts("Inavaible distribution, try again.\nTry: kml --help.")
end

def parser_install
    def distro_install
        def debian_based
            system("sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6 && echo '# Kali Repository (kali-my-linux)' >> /etc/apt/sources.list && echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && apt-get update -m")
        end
        def arch_based
            print "You don't need to install repository. You'll use AUR. (yay)"
        end
        @debian_based_distros.include?($user_distribution) ? debian_based : arch_based
    end
    @avaible_distro.include?($user_distribution) ? distro_install() : puts("Inavaible distribution, try again.\nTry: kml --help.")
end

def parser_list_tools
    Dir.glob('tools/*.txt') {|name_category| p category = File.basename(name_category, '.txt')}
end

def parser_install_tools(category)
    def category_install_tools(category)
        myHash = {}
        Dir.glob('tools/*.txt') do |nome_categoria|
            categoria = File.basename(nome_categoria, '.txt')
            myHash[categoria] = File.readlines(nome_categoria).map(&:chomp)
        end
        $user_distribution.include?(@debian_based_distros.to_s) ? system("sudo apt-get install #{myHash[category].join}") : system("sudo pacman -S #{myHash[category].join}")
    end
    @avaible_distro.include?($user_distribution) ? category_install_tools(category) : puts("Inavaible distribution, try again.\nTry: kml --help.")
end

OptionParser.new do |parser|
    parser.separator("\nDistribution:")
    parser.on('-d [DISTRIBUTION]', '--dist [DISTRIBUTION]', 'Select your distribution.') {|distro| $user_distribution = parser_distro(distro)}
    parser.on('-s', '--show-dists', 'Show avaible distros.') {parser_distro_avaibles()}
    parser.separator("\nInstallation:")
    parser.on('-i', '--install-repository', 'Install repository to your Linux.') {parser_install()}
    parser.on('-u', '--uninstall-repository', 'Remove repository to your Linux.') {parser_uninstall()}
    parser.separator("\nTools:")
    parser.on('-l', '--list', 'List all avaible tools category.') {parser_list_tools()}
    parser.on('-t', '--tools [CATEGORY]', 'Install tools category.') {|category| parser_install_tools(category)}
    parser.separator("\nHelp:")
    parser.on('-h', '--help', 'Show help message.') {puts parser}
end.parse!