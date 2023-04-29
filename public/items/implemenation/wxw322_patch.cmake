
if (enMAJOR_VERSION EQUAL 3 AND enMINOR_VERSION EQUAL 2)
    add_definitions("-include stdint.h")

#    enReplace("native/src/msw/version.rc" "\"Copyright � " "L\"Copyright \\xa9 ") 
    enReplace("native/src/msw/version.rc" ", \"Copyright " ", L\"Copyright \\xa9 1992-2023 wxWidgets development team\\0\" // \"Copyright ") 
    
    enReplace("native/include/wx/msw/wx_dpi_aware_pmv2.manifest" "<trustInfo xmlns=\"urn:schemas-microsoft-com:asm.v3\">" "<trustInfo xmlns=\"urn:schemas-microsoft-com:asm.v1\">")
    enReplace("native/include/wx/msw/wx_dpi_aware.manifest"      "<trustInfo xmlns=\"urn:schemas-microsoft-com:asm.v3\">" "<trustInfo xmlns=\"urn:schemas-microsoft-com:asm.v1\">")
endif()
