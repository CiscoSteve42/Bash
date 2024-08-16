#!/usr/bin/env bash

# Script that I'm currently toying around with while also learning terminal-based email clients as I've never really messed with them. I currently have Mutt and am occasionally poking around with it but I am extremely interested in the Rust-based ones such as meli and Himalaya.

# The purpose is to filter any email from Linkedin or Indeed that contains the word "Unfortunately" and puts them into a separate folder labelled "Rejections". You get the point. 

MAIL_DIR="$HOME/Mail"
REJECT_FOLDER="$MAIL_DIR/Rejections"

mkdir -p "$REJECT_FOLDER"

move_emails() {
  local folder="$1"
  local search_criteria="$2"
  local destination="$3"

      mutt -f "$folder" -e "push '<enter>'" -e "push ':/'" -e "push 'l'" -e "push 's'" -e "push 'n'" -e "push 'o'" -e "push ':'" -e "push 'n'" -e "push ':s/^*//' -e 'move ${destination}'" -e "push '<enter>'" -e "quit" -e "push 'y'" -e "push 'y'" -e "push 'n'" -e "push 'q'"
}

move_emails "$MAIL_DIR/LinkenIn" "Unfortunately" "$REJECT_FOLDER"
move_emails "$MAIL_DIR/Indeed" "Unfortunately" "$REJECT_FOLDER"


