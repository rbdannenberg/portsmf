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

Portsmf is a relatively small number of about 9 files, so there is
currently no support for building/maintaining Portsmf as a separate
library. (Contributions are welcome.) For now, it is suggested that
you simply compile these files along with your application sources.

There is a test program in portsmf_test and CMakeLists.txt files
to build it as an example.

You might want to browse through portsmf_test/allegro_test.cpp 
for examples that use and exercise most of the portsmf functions.

Portsmf was created for "note tracks" in Audacity. This version is
updated to 64-bits differently than the Audacity update, so we're
out-of-sync, and the binary buffer format is different. I followed
my own documentation about keeping doubles aligned on 8-byte
boundaries and I keep integer-type parameters as 64-bit integers
now, even on 32-bit machines.
