#!/bin/bash

IFS="-"

for f in *; do
	echo "----------------------"
	file_ext="${f#*.}"
	echo "File extension: ${file_ext}"
	if [ "$file_ext" = "sh" ]
	then
		echo "Skipping ${f}"		
		break
	fi
	read -ra ADDR <<< "$f"
	if [ "${ADDR[1]}" != " " ]
	then
		new_filename="${ADDR[1]}.${file_ext}"
		echo "New Filename: ${new_filename}"
		echo "Copying file ${f} as ${new_filename}"
		cp ./"${f}" ./tmp/${new_filename}
	fi
	echo "----------------------"
done
