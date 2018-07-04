#!/bin/bash


#simple script that checks the urls in source.txt and writes validated ones to validated.txt
#usage: ./validate.sh source.txt 

touch validated.txt

function validate_url(){
  if [[ `wget -S --spider $1  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then echo $1 >> validated.txt ; fi
}

while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "$line"
    validate_url $line 	
done < "$1"



