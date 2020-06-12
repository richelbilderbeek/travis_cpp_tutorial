#!/bin/bash
#lyx -f --export pdf travis_cpp_tutorial.lyx
lyx -f --export pdflatex travis_cpp_tutorial.lyx
pdflatex travis_cpp_tutorial
pdflatex travis_cpp_tutorial