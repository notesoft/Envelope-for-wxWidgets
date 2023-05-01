

if (enIsMSW AND enIsClang)

    set(evMSYS2_ARG_CONV_EXCL  $ENV{MSYS2_ARG_CONV_EXCL})
    string(FIND "/implib:" ${evMSYS2_ARG_CONV_EXCL} enPos)

    if (NOT evMSYS2_ARG_CONV_EXCL STREQUAL "*" AND ${enPos} EQUAL -1 )
        message(FATAL_ERROR " !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \n enventory variable MSYS2_ARG_CONV_EXCL is: [$ENV{MSYS2_ARG_CONV_EXCL}] \n mast containig [/implib:] or [*] set MSYS2_ARG_CONV_EXCL=/implib \n see https://www.msys2.org/docs/filesystem-paths/ \n !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" )
    endif()
    
endif()