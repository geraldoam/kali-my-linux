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
    print(stylize("@gerald0x01".center(45), colored.fg("red")))