#!/bin/bash

# Check if a device is on the network (takes into account DHCP renewals)
mac="FA:KE:AD:DR:ES:SS"
address="192.168.1.*"
while true; do
    nmap=$(nmap -sP -n $address --host-timeout 5 | grep $mac | cut -d ' ' -f 3)
    if [[ ! -z "$nmap" ]]; 
        then 
            echo "Device is connect to the network" 
        else
            echo "Who dat boi !?"
    fi
    sleep 60
done
