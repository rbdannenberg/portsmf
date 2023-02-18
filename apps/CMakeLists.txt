# portsmf/apps/CMakeLists.txt -- build utilities
#
# Roger B. Dannenberg
# Feb 2023

set(PMDIR "${CMAKE_SOURCE_DIR}/../portmidi/pm_common" CACHE PATH "location of portmidi.h")
set(PMLIB "${PMDIR}/../Release/libportmidi_static.a" CACHE FILEPATH
          "PortMidi library")

if(UNIX AND APPLE)
  set(Threads::Threads "" PARENT_SCOPE)
  find_library(COREAUDIO_LIBRARY CoreAudio REQUIRED)
  find_library(COREFOUNDATION_LIBRARY CoreFoundation REQUIRED)
  find_library(COREMIDI_LIBRARY CoreMIDI REQUIRED)
  find_library(CORESERVICES_LIBRARY CoreServices REQUIRED)
  set(PM_NEEDED_LIBS ${CMAKE_THREAD_LIBS_INIT} ${COREAUDIO_LIBRARY}
      ${COREFOUNDATION_LIBRARY} ${COREMIDI_LIBRARY} ${CORESERVICES_LIBRARY})
endif()


add_executable(allegroconvert allegroconvert.cpp)
target_link_libraries(allegroconvert PRIVATE portsmf-static)
target_include_directories(allegroconvert PUBLIC ..)   
add_executable(allegroplay allegroplay.cpp seq2midi.cpp seq2midi.h midicode.h)
target_link_libraries(allegroplay PRIVATE
        portsmf-static ${PMLIB} ${PM_NEEDED_LIBS})
target_include_directories(allegroplay PUBLIC .. ${PMDIR} ${PMDIR}/../porttime)
message(STATUS "PM LIBS ${PM_NEEDED_LIBS}")
