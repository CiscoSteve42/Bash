#!/bin/bash

echo "Enter the SN for the Unit: "
read -r SN

if [ $? -eq 0 ]; then
                tmux new-session -s "$SN" -n "Test" -d

                        tmux move-window -s "$SN:0" -t "$SN:1"
			tmux send-keys -t "$SN:1" 'cd ~ && ./gen_datafile.sh < <(sleep 3; yes '' | head -n 1) && ./gen_datafile2.sh < <(sleep 3; yes '' | head -n 1) && ./run_scout12*' Enter

                                    tmux new-window -t "$SN:2" -n "Logs"
                                        tmux send-keys -t "$SN:2" "cd ~/618-23087-XXXX-MFG-43022/logs && ls | grep $SN" Enter

						tmux new-window -t "$SN:3" -n "USB"
						    tmux send-keys -t "$SN:3" 'mount /dev/sda1 /mnt && cd /mnt/qis && ls' Enter
                                fi

                                tmux attach -t "$SN"

