
if (enIsMSW AND enIsClang)
    message(STATUS "! bugfix: by default CMake with llvm-rc create file with .rc.res.res extention instade of .rc.res") # -c65001    
    set(CMAKE_RC_COMPILE_OBJECT "<CMAKE_RC_COMPILER> <DEFINES> ${enRC_FLAGS} -fo <OBJECT> <SOURCE>")
endif()
