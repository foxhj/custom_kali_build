#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Run as root!"
    exit 1
fi

apt update
apt full-upgrade -y
apt dist-upgrade -y
apt autoremove -y
apt clean
