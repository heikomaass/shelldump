#!/bin/bash
# Converts all wav files in a folder (incl. subfolders) to mp3 with 320kbps. Needs ffmpeg
if [ -z "$1" ]
then
  echo "path is missing. Usage: convert_to_mp3.sh <path>"
  exit 1;
fi

# Convert all wavs in a path to mp3
for i in "$1"/**/*.wav
do
  echo "$i"
  if [ -f "$i" ]
  then
    ffmpeg -i "$i" -f mp3 -ab 320000 "${i%.*}.mp3"
  fi
done