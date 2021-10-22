#!/usr/bin/env bash

RUN_PATH=$( dirname "$BASH_SOURCE" )

source ${RUN_PATH}/src/helpers.sh
source ${RUN_PATH}/src/packages.sh

main ()
{
    get_os_type

    echo $VERSION
    echo $OS
    
    install_all_pkgs
}

main
