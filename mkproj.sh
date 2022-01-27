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

        -h, --help           Open this help menu
        -n, --name           Project Name
        -g, --gitignore      Use .gitignore
        -p, --public         Set GitHub Repository Visibility to Public
        -c, --code           Automatically opens Visual Studio Code

    Ex: mkproj -n MySexyPythonProject -p -c -g \"python,jupyternotebooks,linux,visualstudiocode,pycharm\"

"
exit
}

#// Argument Parser Switch Case

CODE=false
PUBLIC=false
GITIGNORE=false
NAME=""

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            shift # past argument
            HELP
            ;;
        -n|--name)
            NAME=$2
            shift # past argument
            shift # past value
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


MAIN () {

    echo "Creating Project ${NAME}"
    cd $HOME/code/ && mkdir $NAME && cd $NAME && touch README.md && echo "# ${NAME}" >> README.md

}

MAIN