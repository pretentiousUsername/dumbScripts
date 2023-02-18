# Automagic book compiler

This is a python script that compiles---and I say that very loosely---a
book from a few markdown files and a LaTeX template using pandoc.

How it basically works is you have a bunch of markdown files in a directory
`src/`---or anywhere else you choose, really---all labelled as the chapters
you want them to be. This script then turns them all into one giant
markdown file, which is then turned into a PDF. It's not exactly
groundbreaking in that respect, just useful for larger documents.

I'm assuming you label your files `00.md` for the header, `01.md` for the
first chapter, and so on and so forth.

