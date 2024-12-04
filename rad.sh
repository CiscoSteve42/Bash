#!/bin/bash

echo "Enter the SN for the Unit: "
read -r SN

if [ $? -eq 0 ]; then
  tmux new-session -s "$SN" -n "Test" -d 
    
    tmux move-window -s "$SN:0" -t "$SN:1"
      tmux send-keys -t "$SN:1" 'cd ~ && ./auto.sh' Enter

        tmux new-window -t "$SN:2" -n "Mount"
          tmux send-keys -t "$SN:2" 'mount /dev/sda1 /mnt && cd /mnt/qis' Enter

      fi

      tmux attatch -t "$SN"
