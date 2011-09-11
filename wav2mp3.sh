#!/bin/bash

#check for arguments before starting
if [ $# -gt 0 ]; then
  working_directory=$1

  #This puts it in this format 2008-05-15_17.33.46
  #date -r $filename +%F_%H.%M.%S

  #cd "${working_directory}" || return 1
  wav_files=$(find "${working_directory}" -type f -iname "*.wav")
  #This is a loop for conversion
  for filename in ${wav_files};
  do
    echo $filename
    lame -V0 -h -b 160 --vbr-new "$filename" -o "$filename".mp3
  done

  #end if no command line args was given
else
  echo "Please enter directory to process. Ex: ./convert \"personal calls\""
  exit 1
fi
