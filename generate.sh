#!/bin/bash

header_html=$(cat header_text.html)
index_html=$(cat index_text.html)
key_word={%header%}

output="${index_html//"$key_word"/"$header_html"}"
echo $output > index.html

header_html="${header_html//"index.html"/"../index.html"}"
header_html="${header_html//"logo.png"/"../logo.png"}"

for FILE in source_text/*; do 
  input=$(cat $FILE)
  output="${input//"$key_word"/"$header_html"}"
  file_name="${FILE//"source_text"/"source"}"
  echo $output > $file_name
done