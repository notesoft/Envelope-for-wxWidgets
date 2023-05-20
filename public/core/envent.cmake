
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
    message(STATUS "     CMAKE_HOST_SYSTEM_PROCESSOR = ${CMAKE_HOST_SYSTEM_PROCESSOR}")
    message(STATUS "                           WIN32 = ${WIN32} ")
    message(STATUS "           CMAKE_CXX_COMPILER_ID = ${CMAKE_CXX_COMPILER_ID} ")
    message(STATUS "                                 -  ") 
    message(STATUS "                       enIsClang = ${enIsClang}")
    message(STATUS "                         enIsMSW = ${enIsMSW}")
    message(STATUS "                        enIsMSYS = ${enIsMSYS}")    
    message(STATUS "                         enIsX86 = ${enIsX86}")    
    message(STATUS "=================================================================") 

        
endmacro()

macro(enInitInitializationVars)

    message(STATUS "=== enInitInitializationVars")

    if (WIN32)
        set(enIsMSW ON)
    endif()

    if (enIsMSW)
#
#        execute_process(COMMAND "echo \${env:path}" OUTPUT_VARIABLE enPATH)
#        message(STATUS "enPATH ========   ${enPATH}")

         string(REPLACE   "make" "pacman" enPacman  ${CMAKE_MAKE_PROGRAM})   
         execute_process(COMMAND "${CMAKE_MAKE_PROGRAM}" --version OUTPUT_VARIABLE enMakeVersion )
#        execute_process(COMMAND "pacman"               --version WORKING_DIRECTORY "C:/TOOLSET/msys64/usr/bin"  OUTPUT_VARIABLE enPacmanBuiltfor )
         execute_process(COMMAND "${enPacman}"           --version  OUTPUT_VARIABLE enPacmanVersion )

         if (enMakeVersion MATCHES ".\nBuilt for.*msys\n." AND enPacmanVersion  MATCHES ".Pacman."  )
            set(enIsMSYS ON)
        endif()

        # $ENV{PROCESSOR_ARCHITECTURE}
    endif()

endmacro()

macro(enInitImplemetationVars)

    message(STATUS "=== ImplemetationVars")

    set(enCompiler ${CMAKE_CXX_COMPILER_ID}) 

    if (${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
        set(enIsClang ON)
    endif()

    if (CMAKE_SYSTEM_PROCESSOR MATCHES "(x86)|(X86)|(amd64)|(AMD64)")
        set (enIsX86 ON)
    else ()
        set (enIsX86 OFF)
    endif () 

endmacro()

