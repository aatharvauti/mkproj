#!/bin/bash

HELP () {

echo -e "

    ███╗   ███╗██╗  ██╗██████╗ ██████╗  ██████╗      ██╗
    ████╗ ████║██║ ██╔╝██╔══██╗██╔══██╗██╔═══██╗     ██║
    ██╔████╔██║█████╔╝ ██████╔╝██████╔╝██║   ██║     ██║
    ██║╚██╔╝██║██╔═██╗ ██╔═══╝ ██╔══██╗██║   ██║██   ██║
    ██║ ╚═╝ ██║██║  ██╗██║     ██║  ██║╚██████╔╝╚█████╔╝
    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚════╝ 
                                                    
    mkproj (https://github.com/aatharvauti/mkproj)

    HELP MENU:

    {} required
    [] optional

    Usage: mkproj {Project Name} [Space-Separated Options] 

        -c, --code           Automatically opens Visual Studio Code
        -h, --help           Open this help menu
        -g, --gitignore      Use .gitignore
        -p, --public         Set GitHub Repository Visibility to Public

    Ex: mkproj MySexyPythonProject -p -c -g \"python,jupyternotebooks,linux,visualstudiocode,pycharm\"

"
exit
}
