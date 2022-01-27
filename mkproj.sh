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
        -d, --default        Default Options
        -g, --gitignore      Use .gitignore
        -t, --tfa            2FA (Use this if you have 2FA activated for GitHub)
        -p, --public         Set GitHub Repository Visibility to Public
        -c, --code           Automatically opens Visual Studio Code

    Ex: mkproj -n MySexyPythonProject -p -t -c -g \"python,jupyternotebooks,linux,visualstudiocode,pycharm\"

"
exit
}

#// Argument Parser Switch Case

CODE=false
PUBLIC=false
GITIGNORE=false
TFA=false
NAME=""

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            shift # past argument
            HELP
            ;;
        -d|--default)
            shift # past argument
            CODE=true
            TFA=true
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
        -t|--tfa)
            shift # past argument
            TFA=true
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
    
    if [ $GITIGNORE = true ]; then
        wget -c https://www.toptal.com/developers/gitignore/api/$VALUES_GI -O .gitignore 2>/dev/null
        echo ".obsidian" >> .gitignore
        echo ".log" >> .gitignore
    fi

    if [ $TFA = true ]; then
        if [ $PUBLIC = true ]; then
            echo "WARNING: Setting Repository Visibility to Public"
            python3 -W ignore $HOME/code/mkproj/mkrepo.py $NAME --public --tfa 
        else
            echo "Private"
            python3 -W ignore $HOME/code/mkproj/mkrepo.py $NAME --private --tfa
        fi
    else
        if [ $PUBLIC = true ]; then
            echo "WARNING: Setting Repository Visibility to Public"
            python3 -W ignore $HOME/code/mkproj/mkrepo.py $NAME --public
        else
            echo "Private"
            python3 -W ignore $HOME/code/mkproj/mkrepo.py $NAME --private
        fi
    fi
}

MAIN