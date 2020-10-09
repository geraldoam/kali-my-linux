import json
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


def options():
    print(stylize("[1]", colored.fg("red")), "Install requeriments.")
    print(stylize("[2]", colored.fg("red")), "Tools.")
