
if (enIsMSW AND enIsClang)
    # by default msys2 convert option  /implib:../myLib.lib  incorrect as implib;myLib.lib 
    message(STATUS "! enventory variable MSYS2_ARG_CONV_EXCL is: [$ENV{MSYS2_ARG_CONV_EXCL}] mast containig [/implib:]" )
    message(STATUS "! set MSYS2_ARG_CONV_EXCL=/implib" )
    message(STATUS "! see https://www.msys2.org/docs/filesystem-paths/")
endif()