

if (enIsMSW AND enIsClang)
    set(evMSYS2_ARG_CONV_EXCL  $ENV{MSYS2_ARG_CONV_EXCL})
    if (NOT evMSYS2_ARG_CONV_EXCL STREQUAL "*" AND NOT ${evMSYS2_ARG_CONV_EXCL} MATCHES "./implib.")
        message(FATAL_ERROR " !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! \n enventory variable MSYS2_ARG_CONV_EXCL is: [$ENV{MSYS2_ARG_CONV_EXCL}] \n mast containig [/implib:] or [*] set MSYS2_ARG_CONV_EXCL=/implib \n see https://www.msys2.org/docs/filesystem-paths/ \n !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" )
    endif()
endif()