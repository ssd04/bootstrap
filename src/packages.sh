#!/usr/bin/env bash

source ${RUN_PATH}/src/helpers.sh

install_pkg ()
{
    if [ -z "$1" ]; then
        log_error "No package parameter supplied."
    fi

    case $OS in
        "Ubuntu")
            log_info "Installing package [ $1 ] ..."
            sudo apt-get install $1 -y 1> /dev/null || (log_error "Installation of package $1 failed." && exit 1)
            ;;
        "Arch Linux")
            log_info "Installing package [ $1 ] ..."
            sudo pacman -S $1 --noconfirm 1> /dev/null || (log_error "Installation of package $1 failed." && exit 1)
            ;;
        *)
            log_error "This script is not compatible with this OS.";
            exit 1;
            ;;
    esac
}

install_all_pkgs ()
{
    programs_file=${RUN_PATH}/programs.csv

    while IFS=, read -r program; do
        install_pkg ${program}
	done < ${programs_file}
}
