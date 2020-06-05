Travis C++ tutorial

Richèl Bilderbeek

April 29, 2017

# Contents

## Introduction

This is a Travis C++ tutorial, version 0.3.

### License

This tutorial is licensed under Creative Commons license 4.0.

Figure 1: Creative Commons license 4.0

All C++ code is licensed under GPL 3.0.

Figure 2: GPL 3.0

### Continuous integration

Collaboration can be scary: the other(s)1 may break the project worked on. The project can be of any type, not only programming, but also collaborative writing.

A good first step ensuring a pleasant experience is to use a version control system. A version control system keeps track of the changes in the project and allows for looking back in the project history when something has been broken.

The next step is to use an online version control repository, which makes the code easily accessible for all contributors. The online version control repository may also other additional collaborative tools, like a place where to submit bug reports, define project milestones and allowing external people to submit requests, bug reports or patches.

Up until here, it is possible to submit a change that breaks the build.

A continuous integration tools checks what is submitted to the project and possibly rejects it when it does not satisfy the tests and/or requirements of the project. Instead of manually proofreading and/or testing the submission and mailing the contributor his/her addition is rejected is cumbersome at least. A continuous integration tool will do this for you.

Now, if someone changes you project, you can rest assured that his/her submission does not break the project. Enjoy!

### Tutorial style

This tutorial is aimed at the beginner.

Introduction of new terms and tools All terms and tools are introduced shortly once, by a 'What is' paragraph. This allows a beginner to have a general idea about what the term/tool is, without going in-depth. Also, this allows for those more knowledgeable to skim the paragraph.

Repetitiveness To allow skimming, most chapters follow the same structure. Sometimes the exact same wording is used. This is counteracted by referring to earlier chapters.

From Travis to source Every build, I start from Travis CI its point of view: 'What do I have to do?'. Usually Travis CI has to call at least one build bash script. After describing the Travis file, I will show those build files. Those build files usually invoke Qt Creator project files, which in turn combine source files to executables. It may feel that the best is saved for last, but I'd disagree: this is a Travis tutorial. I also think it makes up for a better narrative, to go from big to small.

### This tutorial

This tutorial is available online at https://github.com/richelbilderbeek/ travis_cpp_tutorial. Of course, it is checked by Travis that: • all the setups described work • this document can be converted to PDF. For this, it needs the files from all of these setups

### Acknowledgements

These people contributed to this tutorial:

- Kevin Ushey, for getting Rcpp11 and C++11 to work
- flywire, for testing

### Collaboration

I welcome collaboration for this tutorial, especially in getting the scripts as clean as possible. If you want to help scraping off some lines, I will be happy to make you a collaborator of some GitHubs.

### Feedback

This tutorial is not intended to be perfect yet. For that, I need help and feedback from the community. All referenced feedback is welcome, as well as any constructive feedback

## Setting up the basic build
### Create a GitHub online
### Bring the git repository to your local computer
### Create a Qt Creator project
### Create the build bash scripts
## The basic build
### What is a C++98 'Hello world' program?
### The Travis
### Qt Creator project
## C++ source file
## Extending the build by one step
### Use of debug and release build
#### What are debug and release builds?
#### The Travis file
#### The build bash scripts
#### The Qt Creator project file
#### The source files
### Use of C++11
#### What is C++11?
#### What is noexcept?
#### The Travis file
#### The Qt Creator project file
#### The source files
### Use of C++14
#### The Travis file
#### The Qt Creator project files
#### The source files
### Adding Boost
#### What is Boost?
#### The Travis file
#### The build bash scripts
#### The Qt Creator project files
#### The source files
### Adding Boost.Test
### Use of clang
#### What is Clang?
#### The Travis file
#### The build bash scrip
#### The Qt Creator project files
#### The source files
### Adding gcov and Codecov
#### What is gcov?
#### What is Codecov?
#### The Travis file
#### The build bash scripts
#### The Qt Creator project files
#### The source files
### Adding OCLint
#### The Travis file
#### The build bash scripts
#### The Qt Creator project files
#### The source files
### Adding profiling
### Adding the Qt library
### Adding the Qt4 library
#### What is Qt4?
#### The Travis file
#### What is xvfb?
#### The Qt Creator project files
#### The source files
### Adding the Qt5 library
#### What is Qt5?
#### The Travis file
#### The Qt Creator project files
#### The source files
### Adding QTest
### Adding Rcpp
#### Build overview
#### The Travis file
#### The build bash scripts
#### The Qt Creator project files
#### The C++ and R source files
#### The C++-only source files
#### The R-only source files
### Adding the SFML library
#### The Travis file
#### The build bash scripts
#### The Qt Creator project files
#### The source files
### Adding SLOCcount
#### The Travis file
#### The build bash scripts
#### The Qt Creator project files
#### The source files
### Adding the Urho3D library
#### Build overview
#### The Travis file
#### The build bash scripts
#### The Qt Creator project files
#### The source files
### Adding the Wt library
#### The Travis file
#### The build bash scripts
#### The Qt Creator project files
#### The source files
## Extending the build by two steps 68 5.1
### Use of gcov in debug mode only
#### Build overview
#### The Travis file
#### The build bash scripts
#### The Qt Creator project files
#### The source files
### Qt and QTest
#### What is QTest?
#### Do not use Boost.Test to test graphical Qt aplications
#### The Travis file
#### The build bash scripts
#### The Qt Creator project files
#### The source files
### C++11 and Boost libraries
### C++11 and Boost.Test
#### The function
#### Test build
#### Exe build
#### Build script
#### Travis script
### C++11 and clang
### C++11 and gcov
#### The Travis file
#### The build bash scripts
#### The Qt Creator project files
#### The source files
### C++11 and Qt
### C++11 and Rcpp
#### C++ and R: the C++ function
#### C++: main source file
#### C++: Qt Creator project file
#### C++: build script
#### R: the R function
#### R: The R tests
#### R: script to install packages
#### The Travis script
### C++11 and SFML
### C++11 and Urho3D
### C++11 and Wt
### C++14 and Boost libraries
### C++14 and Boost.Test
#### The function
#### Test build
#### Exe build
#### Travis script
### C++14 and Rcpp
## Extending the build by multiple steps
### C++11 and use of gcov in debug mode only
#### Build overview
#### The Travis file
#### The Qt Creator project files
#### The source files
### C++11, Boost.Test and gcov
#### The function
#### Test build
#### Normal build
#### Build script
#### Travis script
## Troubleshooting
### sudo apt-get install gcov-5 failed and exited with 100 during
### Cannot find the correct version of a package
### fatal error: Rcpp.h: No such file or directory
## References
### Name
#### What is Name?
#### The Travis file
#### The build bash scripts
#### The Qt Creator project files
#### The source files
