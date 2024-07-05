#!/usr/bin/env bash 

echo "Enter a URL: "
read URL
echo "Enter a file name: "
read file_name
echo "Enter a song name: "
read song_name
echo "Enter an artist name: "
read artist_name
echo "Enter an album name: "
read album_name

yt-dlp $URL
ffmpeg -i *.webm "$file_name".mp3
rm *.webm
id3v2 -t "$song_name" -a "$artist_name" -A "$album_name" "$file_name".mp3

mv *.mp3 ~/Music
