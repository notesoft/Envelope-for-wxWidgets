

macro(enInitNative)

    set(enProjectName wxWidjets-envelope)

    file(READ "${CMAKE_SOURCE_DIR}/native/include/wx/version.h" enVERSION_H_CONTENTS)
    string(REGEX MATCH "wxMAJOR_VERSION[ \t]+([0-9]+)"          enMAJOR_VERSION  ${enVERSION_H_CONTENTS})
    string(REGEX MATCH "([0-9]+)"                               enMAJOR_VERSION  ${enMAJOR_VERSION})
    string(REGEX MATCH "wxMINOR_VERSION[ \t]+([0-9]+)"          enMINOR_VERSION  ${enVERSION_H_CONTENTS})
    string(REGEX MATCH "([0-9]+)"                               enMINOR_VERSION  ${enMINOR_VERSION})
    string(REGEX MATCH "wxRELEASE_NUMBER[ \t]+([0-9]+)"         enRELEASE_NUMBER ${enVERSION_H_CONTENTS})
    string(REGEX MATCH "([0-9]+)"                               enRELEASE_NUMBER ${enRELEASE_NUMBER})
    set(enVERSION ${enMAJOR_VERSION}.${enMINOR_VERSION}.${enRELEASE_NUMBER})

    message(STATUS "=================================================================")
    message(STATUS "envelope for wxWidgets version : ${enVERSION}")
    message(STATUS "=================================================================")

endmacro()


enInitNative()
