#!/bin/zsh


function cd() { builtin cd "$@"; ll; } 

function dev() { 
    devcontainer $1 --workspace-folder . ${@: 2}
}

function vpn-up() {
    echo "Starting the vpn ..."
    (echo "$(sudo cat ~/.secrets/vpn/lfu_vpn.txt)" | sudo openconnect vpn.uibk.ac.at --background --protocol=anyconnect --user=csaw8595 --passwd-on-stdin) >> /dev/null
}

function vpn-down(){
    processId=$(pgrep openconnect)
    if [[ processId ]]; then
        sudo kill -2 $processId
    else
        echo "openconnect pid file does not exist, probably not running"
    fi
}

function tn(){
    dir_name="$1"
    if [ -z "$1" ]; then
        dir_name="${PWD##*/}"
        dir_name="${dir_name:-/}"
    fi
    tmux new -s "$dir_name"
}

function remote_vim(){
   echo "remote neo vim setup"n
}

function set-ssh(){
    remote_name="$1"
    echo "$remote_name"
    if [ -z $remote_name ]; then
        echo "Name for the Connection is needed!"
        exit(1)
    fi
    ssh-keygen -b 2048 -t ed25519 -C "munsman.github@gmail.com" -f "${HOME}/.ssh/keys/${remote_name}" -q -N "" 
    echo "Server Address: "  
    read  remote_address
    ssh-copy-id -i "~/.ssh/keys/${remote_name}" "${remote_address}" || \
        echo "Something went wrong, but to finish the setup run:\n" 
        echo "ssh-copy-id -i" "${HOME}/.ssh/keys/${remote_name}" "${remote_address}"        
}

function latex_pdf(){
    pdflatex --shell-escape -synctex=1 -interaction=nonstopmode abgabe.tex $1
}

function s(){
    nvim $(fzf --preview 'bat --color=always {}' --preview-window '~3')
}

function wlanPassword(){
    security find-generic-password -wa "$1"
}
