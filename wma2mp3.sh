  #!/bin/bash
 # By Marko Haapala
 # converts wma to mp3 recursively. does not delete any static files, so 
 # cleanup and renaming is needed afterwards. 
 #
 # requirements:
 # lame    - http://lame.sourceforge.net/download.php
 # mplayer - apt-get install mplayer or http://www.mplayerhq.hu/design7/dload.html
 
 if [ -n "$1" ]; then
   working_directory=$1
 else
   working_directory=$(pwd)
 fi

 wma_files=$(find "${working_directory}" -type f -iname "*.wma" -iname "*.WMA")
 # Need to change IFS or files with filenames containing spaces will not
 # be handled correctly by for loop
 IFS=$'\n' 
 for wma_file in ${wma_files}; do
    mp3name=$(echo "${wma_file}" | sed 's/\.wma$/\.mp3/g' | sed 's|\.WMA$|\.mp3|g')
    echo $mp3name
 	mplayer -vo null -vc dummy -af resample=44100 \
 	-ao pcm -ao pcm:waveheader "${wma_file}" && lame -m s \
    audiodump.wav -o "$mp3name"
 	rm audiodump.wav
 done
