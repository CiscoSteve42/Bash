#!/usr/bin/env bash


echo "  __   _______    ____"
echo "  \ \ / |_   _|  / ___|  ___  _ __   __ _"
echo "   \ V /  | |____\___ \ / _ \| '_ \ /  \` |"
echo "    | |   | |________) | (_) | | | | (_| |"
echo "    |_|   |_|    |____/ \___/|_| |_|\__, |"
echo "    ================================|___/"
echo "A Script to get Songs off of Youtube"
echo -e "Created by CiscoSteve42\n"


echo "1. Enter a URL (or press 'q' to quit):"
read URL

if [ "$URL" = "q" ]; then
  exit 0
fi 

echo "2. Enter a file name (don't add extension!):"
read file_name
echo "3. Enter a song name:"
read song_name
echo "4. Enter an artist name:"
read artist_name
echo "5. Enter an album name:"
read album_name

yt-dlp $URL

if ls *.webm>/dev/null 2>&1; then
  ffmpeg -i *.webm "$file_name".mp3 && rm *.webm
elif ls *.mp4 1>/dev/null 2>&1; then
  ffmpeg -i *.mp4 "$file_name".mp3 && rm *.mp4
elif ls *.webm>/dev/null 2>&1; then
  ffmpeg -i *.mkv "$file_name".mp3 && rm *.mkv
else
  echo "ERROR: No video found in folder, exiting..."
  exit 1
fi

id3v2 -t "$song_name" -a "$artist_name" -A "$album_name" "$file_name".mp3

mv *.mp3 ~/Music
echo -e "Process Complete\n----------------\nFile added to User's Music Directory."
