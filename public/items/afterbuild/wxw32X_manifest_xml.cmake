

function(notecoreBUGFIX_MANIFEST)

    if(NOT EXISTS ${enMS_MT_EXE})
        message(STATUS "not found ms mt.exe: [${enMS_MT_EXE}]" )
    endif()

    set(MANIFESTS_DIR "${enROOT_DIR}/build/native/lib/clang_x64_lib" ) 
    
    message(STATUS "wxWidgets-envelope bugfix: remove prefix [ms_asmv1:] \n   in *.exe from dir: ${MANIFESTS_DIR}" )

    file(GLOB files ${MANIFESTS_DIR}/*.exe )

    foreach(file ${files})

        string(REPLACE  "${MANIFESTS_DIR}/" "" message_text "${file}")

        set(NM_BINARY_FILE   "${file}")            
        string(REPLACE ".exe" ".bugfix_manifest.xml" NM_MANIFEST_FILE "${NM_BINARY_FILE}")

        execute_process(COMMAND "${enMS_MT_EXE}" "-nologo" "-inputresource:${NM_BINARY_FILE}"       "-out:${NM_MANIFEST_FILE}" )
        file(READ  "${NM_MANIFEST_FILE}" TEXT)

        if (${TEXT} MATCHES ".ms_asmv1:level=.")

            string(REPLACE "ms_asmv1:level="    "level="    TEXT "${TEXT}")
            string(REPLACE "ms_asmv1:uiAccess=" "uiAccess=" TEXT "${TEXT}")         
            file(WRITE "${NM_MANIFEST_FILE}" "${TEXT}")
            execute_process(COMMAND "${enMS_MT_EXE}" "-nologo" "-manifest" "${NM_MANIFEST_FILE}" "-outputresource:${NM_BINARY_FILE};#1"  ) 
            message(STATUS "bugfix: REPLACE MANIFEST in: ${message_text} !!!!!!!!!!!!!!!!! " )

        endif()

       file(REMOVE ${NM_MANIFEST_FILE})

    endforeach()

endfunction()

notecoreBUGFIX_MANIFEST()
