# travis_cpp_tutorial

[![Travis CI logo](TravisCI.png)](https://travis-ci.org)
[![gplv3](http://www.gnu.org/graphics/gplv3-88x31.png)](http://www.gnu.org/licenses/gpl.html)

[![Build Status](https://travis-ci.org/richelbilderbeek/travis_cpp_tutorial.svg?branch=master)](https://travis-ci.org/richelbilderbeek/travis_cpp_tutorial)

Tutorial how to use Travis CI with C++.

Statuses of the repositories used:

 * [![Build Status](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp98.svg?branch=master)](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp98): [travis_qmake_gcc_cpp98](https://github.com/travis_qmake_gcc_cpp98)
 * [![Build Status](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp98_boost.svg?branch=master)](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp98_boost): [travis_qmake_gcc_cpp98_boost](https://github.com/travis_qmake_gcc_cpp98_boost)
 * [![Build Status](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp98_gcov.svg?branch=master)](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp98_gcov): [travis_qmake_gcc_cpp98_gcov](https://github.com/travis_qmake_gcc_cpp98_gcov)
 * [![Build Status](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp98_rcpp.svg?branch=master)](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp98_rcpp): [travis_qmake_gcc_cpp98_rcpp](https://github.com/travis_qmake_gcc_cpp98_rcpp)
 * [![Build Status](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp11.svg?branch=master)](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp11): [travis_qmake_gcc_cpp11](https://github.com/travis_qmake_gcc_cpp11)
 * [![Build Status](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp11_boost.svg?branch=master)](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp11_boost): [travis_qmake_gcc_cpp11_boost](https://github.com/travis_qmake_gcc_cpp11_boost)
 * [![Build Status](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp11_boost_test.svg?branch=master)](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp11_boost_test): [travis_qmake_gcc_cpp11_boost_test](https://github.com/travis_qmake_gcc_cpp11_boost_test)
 * [![Build Status](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp14.svg?branch=master)](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp14): [travis_qmake_gcc_cpp14](https://github.com/travis_qmake_gcc_cpp14)
 * [![Build Status](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp14_boost.svg?branch=master)](https://travis-ci.org/richelbilderbeek/travis_qmake_gcc_cpp14_boost): [travis_qmake_gcc_cpp14_boost](https://github.com/travis_qmake_gcc_cpp14_boost)

## Tools explored

### git

git is a version control system. It tracks the changes made in the project and allows for viewing the project its history. 

### GitHub

GitHub is a site where git repositories are hosted. It gives a git project a website where the files can be viewed. Next to this, there is a project page for issues like bug reports and feature requests.

### Travis CI

Travis CI is a continuous integration (hence the 'CI' in its name) tool that plays well with GitHub. It is activated when someone uploads his/her code to the GitHub.

### Boost

Boost is a collection of C++ libraries.

### Boost.Test

Boost.Test is a C++ testing framework within the Boost libraries.

### gcov

gcov is a GNU tool to measur the code coverage of (among others) C++ code. It can be actived from a Travis script.

### Codecov

Codecov is a tool to display a gcov code coverage result, that plays well with GitHub. It can be actived from a Travis script.

### gprof

gprof is a GNU tool to profile (among others) C++ code. It can be actived from a Travis script.

### Rcpp

Rcpp is an R package that allows mixing R and C++ code.

### Rcpp11

Rcpp is an R package that allows mixing R and C++11 code.