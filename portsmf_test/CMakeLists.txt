# portsfm/portsmf_test/CMakeLists.txt -- build utilities
#
# Roger B. Dannenberg
# Feb 2023

add_executable(portsmf_test portsmf_test.cpp)
target_link_libraries(portsmf_test PRIVATE portsmf-static)
target_include_directories(portsmf_test PUBLIC ..)   
