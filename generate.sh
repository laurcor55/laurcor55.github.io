#!/bin/bash

header_html="$(cat header_text.html)"
index_html="$(cat index_text.html)"
header_key_word={%header%}
footer_html="$(cat footer_text.html)"
footer_key_word={%footer%}

# Sub header and footer in index_html
index_html="${index_html//"$header_key_word"/"$header_html"}"
index_html="${index_html//"$footer_key_word"/"$footer_html"}"
echo $index_html > index.html


# Change header and footer index and logo links for the source_text files
header_html="${header_html//"index.html"/"../index.html"}"
header_html="${header_html//"logo.png"/"../logo.png"}"
footer_html="${footer_html//"index.html"/"../index.html"}"

# Do changes in the source_text files
for FILE in source_text/*; do 
  input_html="$(cat $FILE)"
  input_html="${input_html//"$header_key_word"/"$header_html"}"
  input_html="${input_html//"$footer_key_word"/"$footer_html"}"
  file_name="${FILE//"source_text"/"source"}"
  echo $input_html > $file_name
done
