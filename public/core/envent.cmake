
#message(STATUS "!!! before enventory variable PATH is: [$ENV{PATH}]" )
#set(ENV{PATH} "C:\\TOOLSET\\msys64\\usr\\bin;$ENV{PATH}")

#message(STATUS "!!! after enventory variable PATH is: [$ENV{PATH}]" )

# setx -m PATH "C:\\TOOLSET\\msys64\\usr\\bin;%PATH%"
# set (path_list $ENV{PATH})

function(enShowPATH)

    message(STATUS "") 
    message(STATUS "=== PATH variable item is: =======================================") 

    set(path_list $ENV{Path}) 
    string(REPLACE "\\" "/"  path_list "${path_list}")

    foreach(item  ${path_list})
        message(STATUS "        ${item}")
    endforeach(item)

    message(STATUS "=================================================================") 

endfunction(enShowPATH)

macro(enShowInitializationEnventory)

#set(ENV{PATH} "C:\\TOOLSET\\msys64\\usr\\bin;$ENV{PATH}")


#  "C:/TOOLSET/msys64/usr/bin/make.exe" --version | grep 'Built for'
    message(STATUS "") 
    message(STATUS "=== Initialization Enventory: ====================================")
    message(STATUS "                           WIN32 = ${WIN32}")
    message(STATUS "                   CMAKE_COMMAND = ${CMAKE_COMMAND}")
    message(STATUS "             MSYS2_ARG_CONV_EXCL = $ENV{MSYS2_ARG_CONV_EXCL}")
    message(STATUS "=================================================================") 
endmacro()


macro(enShowImplemenationEnventory)

#  "C:/TOOLSET/msys64/usr/bin/make.exe" --version | grep 'Built for'
    message(STATUS "") 
    message(STATUS "=== Implemenation Enventory: ======================================")
#   message(STATUS "        CMAKE_GENERATOR_PLATFORM = ${CMAKE_GENERATOR_PLATFORM} ")
    message(STATUS "           CMAKE_CXX_COMPILER_AR = ${CMAKE_CXX_COMPILER_AR} ")
#   message(STATUS "                   SIZEOF_VOID_P = ${SIZEOF_VOID_P} ")
#   message(STATUS "                            MSYS = ${MSYS} ")
    message(STATUS "                CMAKE_BUILD_TOOL = ${CMAKE_BUILD_TOOL} ")
    message(STATUS "               CMAKE_SYSTEM_NAME = ${CMAKE_SYSTEM_NAME} ")
    message(STATUS "          CMAKE_SYSTEM_PROCESSOR = ${CMAKE_SYSTEM_PROCESSOR} ")
#   message(STATUS "          PROCESSOR_ARCHITECTURE = ${PROCESSOR_ARCHITECTURE} ")
    message(STATUS "                           WIN32 = ${WIN32} ")
    message(STATUS "           CMAKE_CXX_COMPILER_ID = ${CMAKE_CXX_COMPILER_ID} ")
    message(STATUS "                                 -  ") 
    message(STATUS "                       enIsClang = ${enIsClang}")
    message(STATUS "                         enIsMSW = ${enIsMSW}")
    message(STATUS "=================================================================") 

endmacro()

macro(enInitInitializationVars)

    set(ENV{MSYS2_ARG_CONV_EXCL} "*")

endmacro()

macro(enInitImplemetationVars)

    set(enCompiler ${CMAKE_CXX_COMPILER_ID}) 

    if (${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
        set(enIsClang ON)
    endif()
    if (WIN32)
        set(enIsMSW ON)
    endif()


endmacro()

