#!/bin/bash

# Bash script for converting the exported .PCAPS from my Pwnagotchi to .HCCAPX to crack.
# Downloads cap2hccapx if it can't find it in /usr/bin/

input=$1
output=$2

function download() {
    if [ ! -f "/usr/bin/cap2hccapx" ]; then
        echo "Couldn't find cap2hccapx downloading it now to /usr/bin"
        wget -O cap2hccapx.c https://raw.githubusercontent.com/hashcat/hashcat-utils/master/src/cap2hccapx.c -o /dev/null
        gcc -o cap2hccapx cap2hccapx.c && rm cap2hccapx.c; mv cap2hccapx /usr/bin
    else
        echo -e "\e[1;32m cap2hccapx already installed \e[0m"
    fi
}

function convert() {
    if [ ! -f "$input" ]; then
        echo -e "\e[1;41m No file found with the name $input \e[0m"
        exit 1
    else
        cap2hccapx $input $output
        exit 0
    fi
}

function main() {
    if [[ -z $input || -z $output ]]; then
        echo -e "\e[1;41m missing arguments - usage: bash $0 <input.pcap> <output.hccapx> \e[0m"
        exit 1
    else
        download
        convert $input $output
    fi
}

main