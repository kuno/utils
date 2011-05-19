#!/bin/bash

#check for arguments before starting
if [ $# -gt 0 ]; then


  #get options from command line
  #first option is directory to process we are going to make the output directory match
  DIR_TO_PROCESS=$1

  #Other variables
  ROOT_PATH_TO_OUTPUT="/home/phoneCalls"
  FINAL_OUTPUT_PATH="$ROOT_PATH_TO_OUTPUT"'/'"$DIR_TO_PROCESS"

  #check if the output directory exists, create if necessary
  if [ -d "$FINAL_OUTPUT_PATH" ]; then
    echo ""
  else
    `mkdir "$FINAL_OUTPUT_PATH"`
  fi

  #This puts it in this format 2008-05-15_17.33.46
  #date -r $filename +%F_%H.%M.%S

  #This is a loop for conversion
  for filename in *.WAV
  do
    OUTPUT_NAME=`date -r "$filename" +%F_%H.%M.%S`
    lame -S --preset 24 "$filename" "$FINAL_OUTPUT_PATH"'/'"$OUTPUT_NAME"'.mp3'
  done

  #end if no command line args was given
else
  echo "Please enter directory to process. Ex: ./convert \"personal calls\""
  exit 1
fi
