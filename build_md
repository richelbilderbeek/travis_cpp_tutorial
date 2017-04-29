#!/bin/bash
lyx --export pdflatex travis_cpp_tutorial.lyx
pandoc --wrap=none -f latex -t markdown travis_cpp_tutorial.tex > travis_cpp_tutorial.md
