import os
import time
import json
import distro
import colored
from colored import stylize


def banner():
    print(
        stylize(
            """
            ██ ▄█▀    ███▄ ▄███▓    ██▓    
            ██▄█▒    ▓██▒▀█▀ ██▒   ▓██▒    
            ▓███▄░    ▓██    ▓██░   ▒██░    
            ▓██ █▄    ▒██    ▒██    ▒██░    
            ▒██▒ █▄   ▒██▒   ░██▒   ░██████▒
            ▒ ▒▒ ▓▒   ░ ▒░   ░  ░   ░ ▒░▓  ░
            ░ ░▒ ▒░   ░  ░      ░   ░ ░ ▒  ░
            ░ ░░ ░    ░      ░        ░ ░   
            ░  ░             ░          ░  ░ 

    """,
            colored.fg("red"),
        )
    )
    print(stylize("@gerald0x01".center(53), colored.fg("red")), "\n")
    time.sleep(4)
    os.system("cls" if os.name == "nt" else "clear")


def options():
    print(
        stylize("Choose a category and put the number.", colored.fg("red"))
    )
    print(stylize("[  1 ]", colored.fg("red")), "All tools.")
    print(stylize("[  2 ]", colored.fg("red")), "Exploration tools.")
    print(stylize("[  3 ]", colored.fg("red")), "Forensic tools.")
    print(stylize("[  4 ]", colored.fg("red")), "Hardware tools.")
    print(stylize("[  5 ]", colored.fg("red")), "Information Gethering tools.")
    print(stylize("[  6 ]", colored.fg("red")), "Maintaining Acess tools.")
    print(stylize("[  7 ]", colored.fg("red")), "Password Atack tools.")
    print(stylize("[  8 ]", colored.fg("red")), "Reporting tools.")
    print(stylize("[  9 ]", colored.fg("red")), "Reverse Engineering tools.")
    print(stylize("[ 10 ]", colored.fg("red")), "Sniffing and Spoofing tools.")
    print(stylize("[ 11 ]", colored.fg("red")), "Stress tools.")
    print(stylize("[ 12 ]", colored.fg("red")), "Vulnerability Analysis tools.")
    print(stylize("[ 13 ]", colored.fg("red")), "Web tools.")
    print(stylize("[ 14 ]", colored.fg("red")), "Wireless Atack tools.")
    user_option = int(input())
    return user_option


try:
    banner()
    options()
except:
    print("I can't run it, please, install the requeriments.")
