#!/usr/bin/env bash

#######################
# Logging
#######################
log_error() 
{ 
    printf "ERROR: %s\n" "$1" >&2;
    exit 1;
}

log_info() 
{ 
    printf "INFO: %s\n" "$1";
}

#######################
# General
#######################
get_os_type()
{
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$NAME
        VERSION=$VERSION_ID
    elif type lsb_release > /dev/null 2>&1; then
        OS=$(lsb_release -si)
        VERSION=$(lsb_release -sr)
    else
        OS=$(uname -s)
        VERSION=$(uname -r)
    fi
}

check_if_command_exists()
{
    type $1 &> /dev/null || {
        log_error "Please install command [ $1 ]"
    }
}

check_dependencies()
{
    ############################################
    # $1 - array of strings
    ############################################
    for i in "$1"; do
        check_if_command_exists $i
    done
}


remove_file()
{
    if [ -e "$1" ]; then
        echo -n "The following file will be removed: [ $1 ]. Proceed? (y/n)? "
        read answer
        if echo "$answer" | grep -iq "^y"; then
            rm -rf $1
            log_info "File $1 has been removed."
        else
            return 1
        fi
    fi
}

remove_dir()
{
    if [ -d "$1" ]; then
        echo -n "The following directory will be removed: [ $1 ]. Proceed? (y/n)? "
        read answer
        if echo "$answer" | grep -iq "^y"; then
            rm -rf $1
            log_info "Directory $1 has been removed."
        else
            return 1
        fi
    fi
}
