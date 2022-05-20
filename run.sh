#!/usr/bin/env bash

RUN_PATH=$( dirname "$BASH_SOURCE" )

source ${RUN_PATH}/src/helpers.sh
source ${RUN_PATH}/src/packages.sh
source ${RUN_PATH}/src/devsetup.sh

print_help()
{
cat <<HELP
Usage: ${PROGNAME} [-n|--nvim] [-t|--tmux] [-z|--zsh]

The app to be configured can be chosen by command line arguments.

Command line arguments are as following:
    -h | --help     Print this help
    -n | --nvim     Install and setup neovim

Usage example
    ./run.sh --nvim
HELP
}

main ()
{
    get_os_type

    # Get command line options
    TEMP=$(getopt -o alh --long all,latex,help -- "$@")
    eval set -- "$TEMP"

    while true ; do
        case $1 in
            -l|--latex)
                install_latex;
                shift ;;
            -a|--all)
                install_all_pkgs;
                shift ;;
            -h|--help)
                print_help ; exit 1 ;;
            --) shift ; break ;;
            *) echo "Please check command line parameters.\n" ; print_help ; exit 1 ;;
        esac
    done
}

main $@
