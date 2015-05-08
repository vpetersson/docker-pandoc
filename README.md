# Docker Pandoc

**Tags:** md2pdf, markdown2pdf, latex2pdf

[Pandoc](http://pandoc.org/) is a great tool for creating documents. Unfortunately it is requires a lot of dependencies, and is somewhat hard to get running on Mac OS X. Unfortunately, because all of these dependencies, the container is rather large.

To resolve this, we've packaged all of this into a Docker container. By default, the container is configured to convert Markdown or LaTeX files to PDF, but it can easily be re-purposed for other uses.

## Usage

The container is configured to convert all Markdown (.md or .markdown) and LaTeX (.tex) documents found in `/docs` (inside the container) to PDF files.

    $ docker run --rm \
      -v /folder/with/markdown:/docs \
      vpetersson/pandoc

In the example above, the container would search for Markdown and LaTeX files in `/folder/with/markdown` on your computer. For each file found, a PDF will automatically be generated.

## Markdown tips

### Page breaks

Page breaks are not fully supported in Markdown, but `******` is used in some implementation. Pandoc does unfortunately not support this, but you can use the LaTeX code instead, which is `\newpage`.

### Dates

Similarly, Markdown doesn't support dates, but you can use `\today` from LaTeX for this.

## Command reference

The command used for converting documents are:

    $ pandoc \
      -V geometry:margin=1in \
      -t latex \
      -o infile.pdf \
      outfile.md

