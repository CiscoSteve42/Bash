#!/bin/bash

echo "Enter a SN: "
read SN

echo "Press 1 to Select the Unit's Directory."
echo "Or Press 2 to Search the Entire System from Root."
read choice

if [ choice == "1" ]; then
  echo "What type of unit is this? (Case-Sensitive)"
  read unit
  cd /TSC/TSC/Naomi/${unit}/log && ll -tr | grep ${SN}
elif [ choice == "2" ]; then
  find / -name "*${SN}*" 2>/dev/null 
fi


