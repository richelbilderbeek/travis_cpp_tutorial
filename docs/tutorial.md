# Travis C++ tutorial

**Richèl Bilderbeek**
 
April 29, 2017

[![Travis_logo](/images/TravisCIBig.png "Travis Continuous Integration (CI)"){{: style="height:150px"}](https://travis-ci.org/) [![cpp_logo](/images/cpp_logo.png "C++ programming language"){: style="height:150px"}](https://isocpp.org/)

## Introduction

This is a Travis C++ tutorial, version 0.4.

### License

This tutorial is licensed under Creative Commons license 4.0.

[![CC-BY-SA_icon](/images/CC-BY-SA_icon.png "Attribution 4.0 International (CC BY 4.0)"){: style="width:150px"}](https://creativecommons.org/licenses/by/4.0/)

Figure 1: Creative Commons license 4.0

All C++ code is licensed under GPL 3.0.

[![gplv3_logo](/images/gplv3.png "version 3 of the GNU General Public License"){{: style="width:150px"}](https://www.gnu.org/licenses/gpl-3.0.en.html)

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

**Introduction of new terms and tools** All terms and tools are introduced briefly once, by a 'What is' paragraph. This allows a beginner to have a general idea about what the term/tool is, without going in-depth. Also, this allows for those more knowledgeable to skim the paragraph.

**Repetitiveness** To allow skimming, most chapters follow the same structure. Sometimes the exact same wording is used. This is counteracted by referring to earlier chapters.

**From Travis to source** Every build, I start from Travis CI its point of view: 'What do I have to do?'. Usually Travis CI has to call at least one build bash script. After describing the Travis file, I will show those build files. Those build files usually invoke Qt Creator project files, which in turn combine source files to executables. It may feel that the best is saved for last, but I'd disagree: this is a Travis tutorial. I also think it makes up for a better narrative, to go from big to small.

### This tutorial

This tutorial is available online at https://github.com/richelbilderbeek/travis_cpp_tutorial . Of course, it is checked by Travis that:

- all the setups described work
- this document can be converted to PDF. For this, it needs the files from all of these setups

### Acknowledgements

These people contributed to this tutorial:

- Kevin Ushey, for getting Rcpp11 and C++11 to work
- flywire, for editing and testing

### Collaboration

I welcome collaboration for this tutorial, especially in getting the scripts as clean as possible. If you want to help scraping off some lines, I will be happy to make you a collaborator of some GitHubs.

### Feedback

This tutorial is not intended to be perfect yet. For that, I need help and feedback from the community. All referenced feedback is welcome, as well as any constructive feedback

## Setting up the basic build

The basic build is more than just a collection of files. It needs to be set up.

This chapter shows how to:

- Create a GitHub online
- Bring the git repository to your local computer
- Create a Qt Creator project
- Create the build bash scripts

### Create a GitHub online

**What is GitHub?** GitHub is a site that creates websites around projects. It is said to host these projects. Each project contains at least one, but usually multiple files. These files can be put on your own hard disc, USB stick, or other storage devices. They could also be put at a central place, which is called a repository, so potentially others can also access these. GitHub is such a file repository. GitHub also keeps track of the history of the project, which is also called version control. GitHub uses git as a version control software. In short: GitHub hosts git repositories.

![Alt text](/images/GitHubHomepage.png)

Figure 3 shows the GitHub homepage, https://github.com.

**Register** Before you can create a new repository, you must register. Registration is free for open source projects, with an unlimited2 amount of public repositories.

From the GitHub homepage, https://github.com (see Figure 3), click the top right button labeled 'Sign up'. This will take you to the 'Join GitHub' page (see Figure 4).

[![Alt text](/images/GitHubJoin.png "GitHub")](https://github.com)

Figure 4: The join GitHub page

Filling this in should be as easy. After Filling this in, you are taken to your GitHub profile page (Figure 5).

![Alt text](/images/GitHubProfile.png)

Figure 5: A GitHub profile page

**Creating a repository** From your GitHub profile page (Figure 5), click on the plus ('Create new ...') at the top right, then click 'New repository' (Figure 6).

![Alt text](/images/GitHubCreateRepository.png)

Figure 6: Create a GitHub repository

Do check 'Initialize this repository with a README', add a .gitignore with 'C++' and add a licence like 'GPL 3.0'.

![Alt text](/images/GitHubCreateRepository.png)

Figure 7: Created a GitHub repository

You have now created your own online version controlled repository (Figure 7)!

blockdiag {
    A [shape = circle, label = "main.cpp"];
    B [shape = circle, label = "main.cpp"];
    C [shape = circle, label = "main.cpp"];
    A -> B [label = "version1"];
    B -> C [label = "version2"];
    A -> B -> C;
}

Figure 8: Multiple versions of main.cpp. git allows to always go back to each version of main

### Bring the git repository to your local computer

**What is git?** git is a version control system. It allows you keep a history of a file its content in time. It is the more convenient alternative of making copies before each modification.

[![git-logo](/images/Git-Logo-2Color.png "Git is a free and open source distributed version control system"){: style="width:200px"}](https://git-scm.com/)

Figure 9: git logo

**Using git** Go to the terminal and type the following line to download your repository:

`git clone https://github.com/[username]/[repository]`

Replace '[username]' and '[repository]' with your GitHub username and the repository name. A new folder called '[repository]' is created where you should work in. For example, to download this tutorial its repository to a folder called 'travis_cpp_tutorial':

`git clone https://github.com/richelbilderbeek/travis_cpp_tutorial`

### Create a Qt Creator project

**What is Qt Creator?** Qt Creator is a C++ IDE

[![Qt_Creator_logo](/images/Qt_Creator_logo.png "Qt Creator - A Cross-platform IDE for Application Development"){: style="height:150px"}](https://www.qt.io/product/development-tools)

Figure 10: Qt creator logo

**Creating a new project** Project will have some defaults: GCC.

**What is a Qt Creator project file?** A Qt Creator project file contains the information how a Qt Creator project must be built. It commonly has the .pro file extension.

!!! Fail

![Alt text](/images/)

Figure 11: Overview of converting a C++ project to an executable

blockdiag {
    A [shape = circle, label = "a.h"];
    B [shape = circle, label = "a.cpp"];
    C [shape = circle, label = "a.o"];
    D [shape = flowchart.terminator, label = "executable"];
    E [shape = circle, label = "b.h"];
    F [shape = circle, label = "b.cpp"];
    G [shape = circle, label = "b.o"];
    A -> B [label = "#include", style = dashed];
    B -> C [label = "compiler"];
    C -> D [label = "linker"];
    E -> F [label = "#include", style = dashed];
    F -> G [label = "compiler"];
    G -> D [label = "linker"];
    // simple graph
    A -> B -> C -> D;
    E -> F -> G -> D;
}

Figure 12: From files to executable. The compiler converts source (.cpp) files to object (.o) files. The linker uses these object files to create one executable

**What is qmake?** qmake is a tool to create makefiles.

!!! Fail

Two upper circles: '.pro' -> 'Makefile'
Two lower circles: '.cpp' and '.h', both -> to .pro, both dotted line to 'Makefile'

Figure 13: What qmake does

**What is make?** make is a tool that reads a Makefile and creates an executable 'Makefile' -[make]> 'executable'

Figure 14: What make does

**What is GCC?** GCC, the GNU Compiler Collection, is a collection of compilers, among other, the C++ compiler called g++.

[![GCC_logo](/images/GNU_Compiler_Collection_logo.png "GCC - the GNU Compiler Collection"){: style="height:150px"}](https://gcc.gnu.org/)

Figure 15: GCC logo

**What is g++?** g++ is the C++ compiler that is part of the GCC.

**What is C++98?** C++98 is the first C++ standard in 1998.

**What is the STL?** The STL, the Standard Template Library, is the C++ standard library.

### Create the build bash scripts

**What is bash?** 'bash' is a shell scripting language

## The basic build

This basic build consists of a 'Hello World' program, written in C++98. It uses the Qt Creator default settings: Qt Creator will create a Qt Creator project file, which in turn will use GCC.

- What is a C++98 'Hello world' program? See chapter 3.1
- The Travis build file. See chapter 3.2
- The build script. See chapter ??
- The Qt Creator project file. See chapter 3.3
- The source file. See chapter 3.4

### What is a C++98 'Hello world' program?

A 'Hello World' program shows the text 'Hello world' on the screen. It is a minimal program. Its purpose is to show that all machinery is in place to create an executable from C++ source code.

A listing of a 'Hello world' program is shown at algorithm 3. Here I go through each line:

* `#include <iostream>`

Read a header file called 'iostream'

* `int main( ) { /* your code */ }`

The 'main' function is the starting point of a C++ program. Its body is between curly braces

* `std::cout << "Hello world\n" ;`

Show the text 'Hello world' on screen and go to the next line

### The Travis file

Travis CI is set up by a file called '.travis.yml'. The filename starts with a dot, which means it is a hidden file on UNIX systems. The extension 'yml' is an abbreviation of 'Yet another Markup Language'.

The '.travis.yml' file to build and run a 'Hello world' program looks like this:

Algorithm 1 .travis.yml
```
--8<-- "travis_qmake_gcc_cpp98\.travis.yml"
```

This .travis.yml file has the following elements:

- `language: cpp`

The main programming language of this project is C++

- `dist: xenial`

!!! Fail "Line not documented"

- `compiler: gcc`

The C++ code will be compiled by the GCC (What is GCC? See chapter 2.3)
```
- script:
  − qmake
  − make
  − ./travis_qmake_gcc_cpp98
```

The script that Travis will run.

- `qmake`

'qmake' is called to create a makefile (What is 'qmake'? See chapter 2.3) from the only Qt Creator project file. In this build, the name of this project file is ommitted, as there is only one, but there are chapters in this tutorial where the project name is mentioned explicitly. Note that currently, qmake uses Qt4 (What is Qt4? see chapter 4.11.1)

- `make`

'make' is called to compile the makefile (What is 'make'? See chapter 2.3). In this build, 'make' is called without any arguments, but there are chapters in this tutorial where 'make' is called with arguments

- `./travis_qmake_gcc_cpp98`

Run the created executable called 'travis_qmake_gcc_cpp98'

This Travis script can fail in in multiple places:

1. If the Qt Creator project file is incorrectly formed, 'qmake' will fail, and as it cannot create a valid makefile
2. If the Qt Creator project file is incomplete (for example: by omitting libraries), 'make' will fail. 'qmake' has created a makefile, after which 'make' finds out that it cannot create an executable with that makefile
3. The executable can return an error code. A 'Hello World' program is intended to return the error code for 'everything went fine'. Other programs
in this tutorial return error codes depending on test cases. It may also
be that dynamically linked libraries cannot be found, which crashes the
program at startup

### Qt Creator project

The following Qt Creator project file is used in this 'Hello world' build:

Algorithm 2 travis_qmake_gcc_cpp98.pro
```
--8<-- "travis_qmake_gcc_cpp98\travis_qmake_gcc_cpp98.pro"
```
This Qt Creator project file has the following elements:

- `SOURCES += main . cpp`

The file 'main.cpp' is a source file, that has to be compiled

- `QMAKE_CXXFLAGS += −Wall −Wextra −We f fc++ −Werror`

The project is checked with all warnings ('-Wall'), with extra warnings ('-
Wextra') and with the Effective C++ [1] advices ('-Weffc++') enforced.
A warning is treated as an error ('-Werror'). This forces you (and your
collaborators) to write tidy code.

## C++ source file

The single C++ source file used in this 'Hello world' build is:

Algorithm 3 main.cpp
``` c++
--8<-- "travis_qmake_gcc_cpp98\main.cpp"
```
All the code does is display the text 'Hello world', which is a traditional start for many programming languages. See 3.1 for a line-by-line explanation. The code is written in C++98 (What is C++98? See chapter 2.3). It does not use features from the newer C++ standards, but can be compiled under these newer standards. It will not compile under plain C.

## Extending the build by one step

The following chapter describe how to extend the build in one direction. These are:

- Use a debug and release build: see chapter 4.1
- Use of C++11: see chapter 4.2
- Use of C++14: see chapter 4.3
- Use of Boost: see chapter 4.4
- Use of Boost.Test: see chapter 4.5
- Use of clang: see chapter 4.6
- Use of gcov and Codecov: see chapter 4.7
- Use of gprof: see chapter 4.9
- Use of Qt: see chapter 4.10
- Use of Qt4: see chapter 4.10
- Use of Qt5: see chapter 4.10
- Use of QTest: see chapter 4.13
- Use of Rcpp: see chapter 4.14
- Use of SFML: see chapter 4.15
- Use of Urho3D: see chapter 4.17
- Use of Wt: see chapter 4.18

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
