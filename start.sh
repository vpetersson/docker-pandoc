#!/bin/bash

# Find all LaTeX and Markdown files
MDFILES=$(find /docs -regex '.*\.\(md\|markdown\|tex\)')

cd /docs

if [ -n "$MDFILES" ]; then
    for i in "$MDFILES"; do
        INFILE=$(basename "$i")
        OUTFILE=$(echo "$INFILE" | sed 's/\.\(md\|markdown\|tex\)/\.pdf/g')

        echo "Converting $INFILE..."
        pandoc -V geometry:margin=1in -t latex -o "$OUTFILE" "$INFILE"
    done
else
    echo "No LaTeX or Markdown files found. Exiting."
fi
