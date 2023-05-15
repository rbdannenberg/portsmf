# portsmf README.md
- Roger B. Dannenberg, 14 Jun 2008, updated 2023 (!)

Portsmf is "Port Standard MIDI File", a cross-platform, C++ library
for reading and writing Standard MIDI Files.

License information: free and open source, see license.txt for details

Features:

- input and output of Standard MIDI Files
- data structures, classes, etc. for representing music data in memory
    - sequence structure consisting of multiple tracks
    - track structure consisting of multiple events
    - events contain note and control data
    - extensible attribute-value property lists
    - tempo track and time signature representation
- input and output of a text-based representation: Allegro files
- extensive editing operations on sequences and tracks
- conversion to/from binary buffers for archiving, undo/redo, etc.

Portsmf is a relatively small number of about 9 files, so I recommend
simply compiling the files along with your application sources.
Dan Church contributed updates to Audacities old autoconf-based
build system, so you should also be able to build a makefile for
dynamic or static libraries with `autoreconf -fi` and `configure`.

There is a test program in portsmf_test and CMakeLists.txt files
to build it as an example.

You might want to browse through `portsmf_test/allegro_test.cpp`
for examples that use and exercise most of the portsmf functions.

Portsmf was created for "note tracks" in Audacity. This version is
updated to 64-bits differently than the Audacity update, so we're
out-of-sync, and the binary buffer format is different. I followed
my own documentation about keeping doubles aligned on 8-byte
boundaries and I keep integer-type parameters as 64-bit integers
now, even on 32-bit machines.
