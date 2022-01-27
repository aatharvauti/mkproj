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

#// Argument Parser Switch Case

CODE=false
PUBLIC=false
GITIGNORE=false

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            shift # past argument
            HELP
            ;;
        -c|--code)
            shift # past argument
            CODE=true
            ;;
        -p|--public)
            shift # past argument
            PUBLIC=true
            ;;
        -g|--gitignore)
            VALUES_GI="$2"
            shift # past argument
            shift # past value
            GITIGNORE=true
            ;;
        -*|--*)
            echo "Unknown option $1"
            exit 1
            ;;
        *)
            POSITIONAL_ARGS+=("$1") # save positional arg
            shift # past argument
            ;;
    esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

# // Error
if [[ -n $1 ]]; then
    echo "Last line of file specified as non-opt/last argument:"
    tail -1 "$1"
fi