#!/usr/bin/env bash

python()
{
    local python_bin=$(which python3)
    
    ${python_bin} -m pip install psutil
}

i3()
{
    git clone git://github.com/tobi-wan-kenobi/bumblebee-status ~/.config/i3/
}

golang()
{
    # Install delve debugger for golang
    pushd /tmp
    git clone https://github.com/go-delve/delve
    cd delve
    go install github.com/go-delve/delve/cmd/dlv
    popd

    GO111MODULE=on go get golang.org/x/tools/gopls
    GO111MODULE=on go get golang.org/x/tools/cmd/goimports
}
