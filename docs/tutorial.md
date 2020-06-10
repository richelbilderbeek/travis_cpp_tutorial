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

### Acknowledgments

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
    A [shape = flowchart.terminator,  label = "main.cpp", numbered = v1];
    B [shape = flowchart.terminator,  label = "main.cpp", numbered = v2];
    C [shape = flowchart.terminator,  label = "main.cpp", numbered = v3];
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

A listing of a 'Hello world' program is shown at Algorithm 3. Here I go through each line:

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

This example shows how to use Travis to create a debug and release build.

#### What are debug and release builds?

A debug build means that the executable is created in such a way that helps in debugging it. For example, assert statements are only present in debug builds.
A release build means that the executable is created in a way that allows it to run quicker and have a smaller file size. For example, assert statements are removed from the source code in a release build.

#### The Travis file

The Travis file has to do more things now, as it has to to create and run two different builds.

Here is how that looks like:

Algorithm 4 .travis.yml
```
--8<-- "travis_qmake_gcc_cpp98_debug_and_release\.travis.yml"
```
language: cpp
compiler: gcc
script:
- ./build_debug.sh
- ./travis_qmake_gcc_cpp98_debug_and_release
- ./clean.sh
- ./build_release.sh
- ./travis_qmake_gcc_cpp98_debug_and_release

This .travis.yml file is rather self-explanatory: it builds a debug version, and runs it. After cleaning up, it builds a release version and runs it.

#### The build bash scripts

Both build modes have their own build script. They are very similar to the one described in chapter ??:

Algorithm 5 build_debug.sh
```
--8<-- "travis_qmake_gcc_cpp98_debug_and_release\build_debug.sh"
```
```
#!/ bin/bash
qmake travis_qmake_gcc_cpp98_debug_and_release . pro
make debug
```

Algorithm 6 build_release.sh
```
--8<-- "travis_qmake_gcc_cpp98_debug_and_release\build_release.sh"
```
```
#!/ bin/bash
qmake travis_qmake_gcc_cpp98_debug_and_release . pro
make release
```

The only difference is the added extra parameter to 'make', which is 'debug' for the debug build, and 'release' for the release build.

#### The Qt Creator project file

The Qt Creator project file has to allow for the two different builds. It does so
as follows:

Algorithm 7 travis_qmake_gcc_cpp98_debug_and_release.pro
```
--8<-- "travis_qmake_gcc_cpp98_debug_and_release\build_release.pro"
```
```
SOURCES += main.cpp
# Debug and release mode
CONFIG += console debug_and_release
CONFIG(release, debug|release) {
DEFINES += NDEBUG
}
Next to setting 'main.cpp' as the only source file, these lines are new:
• CONFIG += console debug_and_release
Create a debug and release make?les
• CONFIG( release , debug | release ) {
DEFINES += NDEBUG
}
In the release make?le only, the preprocessor symbol 'NDEBUG' is #defined. This, among others, will remove all assert statements
```

#### The source files

This build uses a 'Hello world'-like program that shows and proves the mode in which it is built:

Algorithm 8 main.cpp
```
--8<-- "travis_qmake_gcc_cpp98_debug_and_release\main.cpp"
```
```
#include <cassert>
#include <iostream>
int main() {
#ifdef NDEBUG
std : : cout << "Release mode" << '\n ' ;
assert(1==2);
#else
std : : cout << "Debug mode" << '\n ' ;
assert(1+1==2);
#endif
}
```

It will show in text the build type. Next to this, an assert is called. In release mode, the known-to-be-false assert statement is removed. In debug mode, the known-to-be-true assert statement is left in.

### Use of C++11

In this example, the basic build (chapter 3) is extended by using C++11, instead of C++98.

#### What is C++11?

C++11 is the C++ standard formalized in 2011. Its working title was C++0x, as then it was assumed that the standard would be ?nished in 200x. C++11 is fully backwards compatible with C++98. One of the major new features of C++11 is the introduction of move semantics, which results in faster run-time code, by possibly reducing needless copies of objects.
In my examples, I typically use the C++11 'noexcept' keyword (What is noexcept? See chapter 4.2.2).

4.2.2 What is noexcept?

'noexcept' is a C++11 keyword. It is a modi?er that speci?es that a (member) function will not throw an exception. Would that function throw an exception anyhow, the program is terminated.

4.2.3 The Travis file

The default Travis CI setup is not su?cient to use C++11 (yet). Travis CI by default uses a LTS ('Long Term Stable') repository, as these is the most stable and reliable. The version of g++ in that repository is version 4.6.3, which does not support C++11. To use C++11, we will ?rst add a fresher (less stable) repository. Then we can install g++-5,that does support C++11.

Here is how that looks like:

Algorithm 9 .travis.yml
```
--8<-- "travis_qmake_gcc_cpp11\.travis.yml"
```
language: cpp
compiler: gcc
dist: trusty
script:
- qmake
- make
- ./travis_qmake_gcc_cpp11

This .travis.yml file has some new features:

• sudo : require
For this build, we need super user rights. When you need super user rights, the build will be slower.
• before_install :
The following events will take place before installation
• sudo add−apt−repository −−yes ppa : ubuntu−toolchain−r/ test
A new apt repository is added. The '?yes' explicitly states that we are
sure we want to do this. Without the '?yes' ?ag, Travis will be prompted
if it is sure it wants to add this repository. This would break the build.
• sudo apt−get update −qq
After adding the new apt repository, then the current repositories need to
be updated updated. The '-qq' means that this happens quietly; with the
least amount of output.
• install : sudo apt−get install −qq g++−5
Install g++-5, which is a newer version of GCC than is installed by default

In the script, the code is built and then run.

4.2.4 The Qt Creator project file

The Qt Creator project file by default calls 'g++' with its default C++ standard.

In this build, we will have to let it call g++-5 with the C++11 standard:

Algorithm 10 travis_qmake_gcc_cpp11.pro
```
--8<-- "travis_qmake_gcc_cpp11\travis_qmake_gcc_cpp11.pro"
```
```
# Project files
SOURCES += main.cpp
# Compile with high warning levels, a warning is an error
QMAKE_CXXFLAGS += -Wall -Wextra -Wshadow -Wnon-virtual-dtor -pedantic -Weffc++ -Werror
# C++11
CONFIG += c++11
QMAKE_CXXFLAGS += -std=c++11
The Qt Creator project file has the same lines as the basic project in chapter 3, except for:
• QMAKE_CXX = g++−5
Set the C++ compiler to use g++ version 5, which is a newer version than
currently used by default
• QMAKE_LINK = g++−5
Set the C++ linker to use g++ version 5, which is a newer version than
currently used by default
• QMAKE_CC = g++5
Set the C compiler to use g++ version 5, which is a newer version than
currently used by default
• QMAKE_CXXFLAGS += −std=c++11
Compile under C++11
```

Except for this, all is just the same.

4.2.5 The source files

This build uses a 'Hello world'-like program that uses C++11:

Algorithm 11 main.cpp
```
--8<-- "travis_qmake_gcc_cpp11\main.cpp"
```
```
#include <iostream>
// C++11
void f () noexcept
{
std : : cout << "Hello world\n" ;
}
int main()
{
f () ;
}
```

It will show the text 'Hello world' on screen.

The keyword 'noexcept' (What is noexcept? See chapter 4.2.2) does not exist in C++98 and it will fail to compile. This code will compile under newer versions of C++.

### Use of C++14

In this example, the basic build (chapter 3) is extended by using C++14. What is C++14? C++14 is a C++ standard that was formalized in 2014. It is fully backwards compatible with C++11 and C++98. It does not have any major new features, and mostly extends C++11 features.
In my examples, I usually add digit seperators: instead of '1000', in C++14 one can write '1'000', using a single quote as a seperator. This will not compile in C++11.

#### The Travis file

Setting up Travis is done by the following .travis.yml:

Algorithm 12 .travis.yml
```
--8<-- "travis_qmake_gcc_cpp14\.travis.yml"
```
```
language: cpp
compiler: gcc
dist: trusty
before_install:
# C++14
- sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
- sudo apt-get update -qq
install:
# C++14
- sudo apt-get install -qq g++-5
- sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 90
script:
- qmake
- make
- ./travis_qmake_gcc_cpp14
```

This .travis.yml file is the same as the C++11 build in chapter 4.2.

#### The Qt Creator project files

This single file is compiled with qmake from the following Qt Creator project file:

Algorithm 13 travis_qmake_gcc_cpp14.pro
```
--8<-- "travis_qmake_gcc_cpp14\travis_qmake_gcc_cpp14.pro"
```
```
SOURCES += main.cpp
# Compile with high warning levels, a warning is an error
QMAKE_CXXFLAGS += -Wall -Wextra -Wshadow -Wnon-virtual-dtor -pedantic -Weffc++ -Werror
# C++14
CONFIG += c++14
QMAKE_CXXFLAGS += -std=c++14
```
The Qt Creator project file has the same lines as the C++11 build in chapter 4.2, except for that it uses one different QMAKE_CXXFLAGS item:
• QMAKE_CXXFLAGS += −std=c++14
Compile under C++14

#### The source files

The single C++ source file used is:

Algorithm 14 main.cpp
```
--8<-- "travis_qmake_gcc_cpp14\main.cpp"
```
```
#include <iostream>
// C++14
auto f () noexcept
{
return "Hello world\n" ;
}
int main()
{
std : : cout << f () ;
}
```

This is a simple C++14 program that will not compile under C++11.

### Adding Boost

In this example, the basic build (chapter 3) is extended by also using the Boost libraries.

#### What is Boost?

Boost is a collection of C++ libraries.

[![Boost_logo](/images/Boost_logo.png "GCC - the GNU Compiler Collection"){: style="height:150px"}](https://gcc.gnu.org/)

Figure 16: Boost logo

#### The Travis file

Setting up Travis is done by the following .travis.yml:

Algorithm 15 .travis.yml
```
--8<-- "travis_qmake_gcc_cpp98_boost\.travis.yml"
```
language: cpp
compiler: gcc
addons:
apt:
packages: libboost-all-dev
script:
- ./build.sh
- ./travis_qmake_gcc_cpp98_boost

This .travis.yml file has one new feature:

• addons :
apt :
packages : libboost−all −dev
This makes Travis aware that you want to use the aptitude package
'libboost-all-dev'. Note that this code cannot be put on one line: it has
to be indented similar to this
Using packages like this avoids using sudo, which speeds up the build. Not all
packages can be used as such, however, but most are.

#### The build bash scripts

The bash build script to build and run this:

Algorithm 16 build.sh
```
--8<-- "travis_qmake_gcc_cpp98_boost\build.sh"
```
```
#!/ bin/bash
qmake
make
```

The bash script is identical to the basic build script as in chapter ??.

4.4.4 The Qt Creator project files

This single file is compiled with qmake from the following Qt Creator project file:

Algorithm 17 travis_qmake_gcc_cpp98_boost.pro
```
--8<-- "travis_qmake_gcc_cpp98_boost\build.sh"
```
SOURCES += main.cpp
QMAKE_CXXFLAGS += -Wall -Wextra -Weffc++ -Werror

The Qt Creator project file has the same lines as the basic project in chapter 3.3.

#### The source files

The single C++ source file used is:

Algorithm 18 main.cpp
```
--8<-- "travis_qmake_gcc_cpp98_boost\main.cpp"
```
```
#include <iostream>
#include <boost/version .hpp>
int main() {
std : : cout << BOOST_LIB_VERSION << '\n ' ;
}
```

All the file does is display the version of Boost on the screens. It will only compile when the Boost libraries are present. Currently, on Travis CI, the default Boost version is 1.46.1.

4.5 Adding Boost.Test

Adding only a testing framework does not work: it will not compile in C++98. Instead, this is covered in chapter 5.4.

4.6 Use of clang

In this example, the basic build (chapter 3) is compiled by the clang compiler.

4.6.1 What is Clang?

clang is a C++ compiler

[![LLVM_Logo](/images/LLVM_Logo.png "GCC - the GNU Compiler Collection"){: style="height:150px"}](https://gcc.gnu.org/)

Figure 17: clang logo

4.6.2 The Travis file

Setting up Travis is done by the following .travis.yml:

Algorithm 19 .travis.yml
```
--8<-- "travis_qmake_clang_cpp98\.travis.yml"
```
language: cpp
compiler: gcc
addons:
apt:
packages: clang
script:
- ./build.sh
- ./travis_qmake_clang_cpp98

This .travis.yml file uses the package clang (without needing sudo), compiles
the program and then runs it.

4.6.3 The build bash scrip

The bash build script to build this:

Algorithm 20 build.sh
```
--8<-- "travis_qmake_clang_cpp98\build.sh"
```
```
#!/ bin/bash
qmake
make
```

The bash script is identical to the basic bash script as described in chapter ??.

4.6.4 The Qt Creator project files

This single file is compiled with qmake from the following Qt Creator project file:

Algorithm 21 travis_qmake_clang_cpp98.pro
```
--8<-- "travis_qmake_clang_cpp98\travis_qmake_clang_cpp98.pro"
```
```
SOURCES += main.cpp
# Compile at a high warning level, a warning is an error
QMAKE_CXXFLAGS += -Wall -Wextra -Weffc++ -Werror
# clang
QMAKE_CXX = clang++
QMAKE_LINK = clang++
QMAKE_CC = clang
```

The Qt Creator project file.. except for:
• QMAKE_CXX = clang++
Set the C++ compiler to use clang++
• QMAKE_LINK = clang++
Set the C++ linker to use clang++
• QMAKE_CC = clang
Set the C compiler to use clang

4.6.5 The source files

The single C++ source file used is:

Algorithm 22 main.cpp
```
--8<-- "travis_qmake_clang_cpp98\main.cpp"
```
```
#include <iostream>
int main() {
std : : cout << "Hello world\n" ;
}
```

This is just a 'Hello world' program, as discussed in detail in chapter .

4.7 Adding gcov and Codecov

In this example, the basic build (chapter 3) is extended by calling gcov and
using codecov to show the code coverage.

4.7.1 What is gcov?

gcov is a tool that works with GCC to analyse code coverage

4.7.2 What is Codecov?

Codecov works nice with GitHub and give nicer reports

[![Codecov](/images/Codecov.png "GCC - the GNU Compiler Collection"){: style="height:150px"}](https://gcc.gnu.org/)

Figure 18: Codecov logo

Here is an example of a code coverage report, which is generated by this
example:

[![Codecov_report](/images/*.png "GCC - the GNU Compiler Collection"){: style="height:150px"}](https://gcc.gnu.org/)

Figure 19: Codecov report of this build

4.7.3 The Travis file

Setting up Travis is done by the following .travis.yml:

Algorithm 23 .travis.yml
```
--8<-- "travis_qmake_gcc_cpp98_gcov\.travis.yml"
```
sudo: require
language: cpp
compiler: gcc
before_install:
- sudo pip install codecov
script:
- qmake travis_qmake_gcc_cpp98_gcov.pro
- make
- ./travis_qmake_gcc_cpp98_gcov
- ./get_code_cov
- codecov
after_success:
- bash <(curl -s https://codecov.io/bash)

This .travis.yml file has some new features:

• sudo : require
Travis will give super user rights to the script. This will slow the build
time, but it is inevitable for the next step
• before_install : sudo pip install codecov
Travis will use pip to install codecov using super user rights. It is tempo-
rary workaround to use sudo, as sudo should not be needed. This is seen
as a bug, is known and solved. It just has to seep through to the Travis
CI GNU/Linux distro.
• after_success : codecov
After the script has run successfully, codecov is called
The code coverage performed in this build mismatches with the goals of code
coverage. One of these goals is to test for unused ('dead') code. Code coverage
?ts better within a debug build, where all functions are tested with valid and
invalid input. Chapter 6.1 shows a build in which code coverage is tested in
debug mode only.

4.7.4 The build bash scripts

The bash build to measure the code coverage:

Algorithm 24 get_code_cov
```
--8<-- "travis_qmake_gcc_cpp98_gcov\get_code_cov"
```
```
#!/ bin/bash
for filename in ` find . | egrep '\.cpp ' `;
do
gcov −n −o . $filename > /dev/null ;
done
```

This script uses gcov on all implementation files.
Going into a bit more detail on the new lines:
• for filename in ` find . | egrep '\.cpp ' `;
do
gcov −n −o . $filename > /dev/null ;
done
Find all filenames (in this folder and its subfolder) that end with '.cpp'.
For each of these filenames, let 'gcov' work on it. The '-n' ?ag denotes 'no output please'. Because there is still some output, this output is sent to the void of '/dev/null'. The '-o .' means that the object files are in the same folder as this script

4.7.5 The Qt Creator project files

This normal is compiled with qmake from the following Qt Creator project file:

Algorithm 25 travis_qmake_gcc_cpp98_gcov.pro
```
--8<-- "travis_qmake_gcc_cpp98_gcov\travis_qmake_gcc_cpp98_gcov.pro"
```
```
SOURCES += main.cpp
# Compile with a high warning level, a warning is an error
QMAKE_CXXFLAGS += -Wall -Wextra -Weffc++ -Werror
# gcov
QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
LIBS += -lgcov
```

The Qt Creator project file has two new lines:
• QMAKE_CXXFLAGS += −fprofile −arcs −ftest −coverage
Let the C++ compiler add coverage information
• LIBS += −lgcov
Link against the gcov library

4.7.6 The source files

The C++ source file used by the normal build is:

Algorithm 26 main.cpp
```
--8<-- "travis_qmake_gcc_cpp98_gcov\main.cpp"
```
```
#include <iostream>
///Returns the value of x multiplied by 2,
/// except for 42, which is multiplied by one
int do_magic(const int x) {
if (x == 42) {
return 42;
}
return x ∗ 2;
}
int main() {
std : : cout << do_magic(2) << '\n ' ;
//Forgot to test do_magic(42)
}
```

It defines a function called 'do_magic'. It is called for the value two, but
not for the value 42. Due to this, we expect to see an incomplete code coverage.
And this is indeed detected, as shown in Figure 19.

4.8 Adding OCLint

In this example, the basic build (chapter 3) is extended by adding OCLint
support. Because we intendedly use smelly code, this build is supposed to fail
due to (only) this.

What is OCLint? OCLint is a static code analysis tool.

4.8.1 The Travis file

Setting up Travis is done by the following .travis.yml:

Algorithm 27 .travis.yml
```
--8<-- "travis_qmake_gcc_cpp98_oclint\.travis.yml"
```
language: cpp
compiler: gcc
sudo: required
install:
- sudo add-apt-repository ppa:ubuntu-toolchain-r/test --yes
- sudo apt-get update -qq
- sudo apt-get install -qq libstdc++6-4.7-dev
- ./install_oclint.sh
script:
- ./build.sh
- ./travis_qmake_gcc_cpp98_oclint
- ./do_oclint.sh

This .travis.yml file has one new feature:
• sudo add−apt−repository ppa : ubuntu−toolchain−r/ test −−yes
Add a newer apt repository than installed on Travis
• sudo apt−get update −qq
Update the packages
• sudo apt−get install −qq libstdc++6−4.7−dev
This makes Travis install the package 'libstdc++6-4.7-dev', that is needed
by OCLint
• ./ install_oclint . sh
This makes Travis install OCLint
• ./ do_oclint . sh
Let OCLint check the code
• cat log_correct . txt
Let Travis show the log of a file that passes OCLint
• cat log_correct . txt
Let Travis show the log of a file that does not pass OCLint