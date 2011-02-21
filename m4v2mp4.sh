#!/bin/bash

current_directory=$(pwd)

m4v_files=$(find "${current_directory}" -type f -iname "*.m4v")
IFS=$'\n'
for m4v_file in ${m4v_files}; do
  name=$(echo "${m4v_file}" | sed -e's/\.m4v$//g')
  mv "${name}".m4v "${name}".mp4
done
