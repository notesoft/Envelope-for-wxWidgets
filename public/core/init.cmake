


function(enInitPrivate)

    set(enProjectName Project-envelope PARENT_SCOPE)

    string(APPEND initText "# Your personal initialization setup here.\n")
    string(APPEND initText "\nset(CMAKE_INSTALL_PREFIX ../dist)")
    string(APPEND initText "\nset(enMS_MT_EXE mt.exe)")
    string(APPEND initText "\nset(enMS_RC_EXE rc.exe)")
    string(APPEND initText "\n# ...")

    string(APPEND implText "# Your personal implemenation setup here.\n")
    string(APPEND implText "\n# ...")

    string(APPEND finlText "# Your personal finalization setup here.\n")
    string(APPEND finlText "\n# ...")

    string(APPEND aftrText "# Your personal post-build  macros here.\n")
    string(APPEND aftrText "# This file may be deleted.\n")
    string(APPEND aftrText "\n# ...")

    string(APPEND befrText "# Your personal pre-build  macros here.\n")
    string(APPEND befrText "# This file may be deleted.\n")
    string(APPEND befrText "\n# ...")

    string(APPEND macrText "# Your personal common CMake macros here.\n")
    string(APPEND macrText "# This file may be deleted.\n")
    string(APPEND macrText "\n# ...")

    string(APPEND initReadMe "# Place in this folder native project files.\n")
    string(APPEND initReadMe "# Of course, replace this CMakeList.txt to native project CMakeList.txt\n")

    string(APPEND natvText "# Native project initialization setup here.\n")
    string(APPEND natvText "# Parse project version etc...\n")
    string(APPEND natvText "\nset(enProjectName Project-envelope)\n")
    string(APPEND natvText "\n# ...\n")

    string(APPEND natvText "\n# macro(enInitNative)")
    string(APPEND natvText "\n#    ...")
    string(APPEND natvText "\n# endmacro()")
    string(APPEND natvText "\n# enInitNative()")
    
    if (NOT EXISTS ${CMAKE_SOURCE_DIR}/private/items/initialization/setup.cmake) 
        file(WRITE ${CMAKE_SOURCE_DIR}/private/items/initialization/setup.cmake ${initText} )
    endif()
    if (NOT EXISTS ${CMAKE_SOURCE_DIR}/private/items/implemenation/setup.cmake) 
        file(WRITE ${CMAKE_SOURCE_DIR}/private/items/implemenation/setup.cmake  ${implText})
    endif()
    if (NOT EXISTS ${CMAKE_SOURCE_DIR}/private/items/finalization/setup.cmake) 
        file(WRITE ${CMAKE_SOURCE_DIR}/private/items/finalization/setup.cmake   ${finlText})
    endif()
    if (NOT EXISTS ${CMAKE_SOURCE_DIR}/private/items/beforebuild) 
        file(WRITE ${CMAKE_SOURCE_DIR}/private/items/beforebuild/commands.cmake   ${befrText})
    endif()
    if (NOT EXISTS ${CMAKE_SOURCE_DIR}/private/items/afterbuild) 
        file(WRITE ${CMAKE_SOURCE_DIR}/private/items/afterbbuild/commands.cmake  ${aftrText})
    endif()
    if (NOT EXISTS ${CMAKE_SOURCE_DIR}/private/macros) 
        file(WRITE ${CMAKE_SOURCE_DIR}/private/macros/common.cmake   ${macrText})
    endif()
    if (NOT EXISTS ${CMAKE_SOURCE_DIR}/public/core/native.cmake) 
        file(WRITE ${CMAKE_SOURCE_DIR}/public/core/native.cmake ${natvText} )
    endif()

    # if (NOT EXISTS ${CMAKE_SOURCE_DIR}/native/CMakeLists.txt) 
    #     file(WRITE ${CMAKE_SOURCE_DIR}/native/CMakeLists.txt  ${initReadMe})
    # endif()

    if (NOT EXISTS ${CMAKE_SOURCE_DIR}/public/items/initialization) 
        file(MAKE_DIRECTORY  ${CMAKE_SOURCE_DIR}/public/items/initialization)
    endif()
    if (NOT EXISTS ${CMAKE_SOURCE_DIR}/public/items/implemenation) 
        file(MAKE_DIRECTORY  ${CMAKE_SOURCE_DIR}/public/items/implemenation)
    endif()
    if (NOT EXISTS ${CMAKE_SOURCE_DIR}/public/items/finalization) 
        file(MAKE_DIRECTORY  ${CMAKE_SOURCE_DIR}/public/items/finalization)
    endif()
    if (NOT EXISTS ${CMAKE_SOURCE_DIR}/public/items/beforebuild) 
        file(MAKE_DIRECTORY  ${CMAKE_SOURCE_DIR}/public/items/beforebuild)
    endif()
    if (NOT EXISTS ${CMAKE_SOURCE_DIR}/public/items/afterbuild) 
        file(MAKE_DIRECTORY  ${CMAKE_SOURCE_DIR}/public/items/afterbuild)
    endif()


endfunction()


macro(enIncludeCMakeFolders enGroup enFolder)

    file(GLOB cmakeFiles public/${enFolder}${enGroup}/*.cmake)
    foreach(cmakeFile ${cmakeFiles})
        message(STATUS "include file ${cmakeFile} ")
        include(${cmakeFile})
    endforeach(cmakeFile)

    file(GLOB cmakeFiles private/${enFolder}${enGroup}/*.cmake)
    foreach(cmakeFile ${cmakeFiles})
        message(STATUS "include file ${cmakeFile} ")
        include(${cmakeFile})
    endforeach(cmakeFile)

    unset(enSourceFilder)
   
endmacro()

macro(enIncludeCMakeItems enGroup)
    enIncludeCMakeFolders("/${enGroup}" "items")
endmacro()

macro(enIncludeCMakeMacros)
    enIncludeCMakeFolders("" "macros")
endmacro()


macro(enInitialization)
    enInitInitializationVars()
    enInitPrivate()
    if (EXISTS ${CMAKE_SOURCE_DIR}/public/core/native.cmake)
        include(./public/core/native.cmake)
    endif()
    enIncludeCMakeItems("initialization") 
    enShowInitializationEnventory()
    enShowPATH()
endmacro()

macro(enImplemenation)
    enInitImplemetationVars()
    enIncludeCMakeItems("implemenation") 
    enShowImplemenationEnventory()
endmacro()

macro(enEncapsulation)
    if (EXISTS ${CMAKE_SOURCE_DIR}/native/CMakeLists.txt ) 
        add_subdirectory("native")
    else()
        message(STATUS "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!|")    
        message(STATUS "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!|")    
        message(STATUS "          Not found ${CMAKE_SOURCE_DIR}/native/CMakeLists.txt.")    
        message(STATUS "          Place native project files in './native' folder.")    
        message(STATUS "          Of course, CMakeList.txt mast be.")        
        message(STATUS "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!|")    
        message(STATUS "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!|")    
    endif()
endmacro()

macro(enFinalization)
    enAddAlwaysTargets()
    enIncludeCMakeItems("finalization") 
endmacro()



