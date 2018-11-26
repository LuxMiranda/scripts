#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Error: no file specified"
  exit 1
fi

file=$1
kwargs="${@:2}"
pdfname="_${file%.*}"

pandoc "$file" --from markdown+fancy_lists --to latex --template="default.latex" --highlight-style=pygments --metadata date="`~/.pandoc/dateOrdinal.sh`" $kwargs -o "$pdfname.pdf"
