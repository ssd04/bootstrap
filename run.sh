#!/usr/bin/env bash

RUN_PATH=$( dirname "$BASH_SOURCE" )

source ${RUN_PATH}/src/helpers.sh
source ${RUN_PATH}/src/packages.sh
source ${RUN_PATH}/src/devsetup.sh

main ()
{
    get_os_type

    echo $VERSION
    echo $OS
    
    # install_all_pkgs
    #golang
    install_spotify
}

main
