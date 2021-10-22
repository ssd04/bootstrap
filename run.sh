#!/usr/bin/env bash

source ./src/helpers.sh

main ()
{
    get_os_type

    echo $VERSION
    echo $OS
}

main
