#!/usr/bin/env bash

# Not a finished product! This is just me dicking around for a few hours after reading Black Hat Bash for half the day. 

echo "   _____ _____     _   _ _____ ____"
echo "  | ____|__  /    | \ | |  ___/ ___|"
echo "  |  _|   / /_____|  \| | |_  \___ \\"
echo "  | |___ / /|_____| |\  |  _|  ___) |"
echo "  |_____/___ |    |_| \_|_|   |____/"
echo "  =================================="
echo "  A terminal tool to automate adding" 
echo "   new NFS clients to your server." 
echo "     written by CiscoSteve42"

if [ "$EUID" -ne 0 ]; then
  echo "This program requires root privileges, please run again as root"
  exit 1
fi

LOC=$(cat /etc/exports | grep 192.168 && grep 10.0)
printf "\nPlease enter the IP address that you'd like to add today:\n"
read -r IP

case ${IP} in 
  ${LOC})
    echo "${IP} has already has a NFS Entry, exiting..."
    exit 1
  ;;
  *)
    echo "${IP} not in /etc/exports, adding..."

    sudo echo "${IP}(rw,sync,no_subtree_check)" >> /etc/exports 
    sudo exportfs -ra
    sudo systemctl restart nfs-kernel-server

    echo "${IP} can now mount to the NFS server, creating client-side script to connect..."

  ;;
esac
