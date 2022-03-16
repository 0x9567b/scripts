#!/bin/bash

#Check if I device is connected to the network by identifying the mac address provided to it, repeating every 60 seconds. Built to help fault find my terrible smart phones connection issues.
#(takes into account DHCP renewals)
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
