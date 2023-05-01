

function (_get_all_cmake_targets out_var current_dir)
    get_property(targets DIRECTORY ${current_dir} PROPERTY BUILDSYSTEM_TARGETS)
    get_property(subdirs DIRECTORY ${current_dir} PROPERTY SUBDIRECTORIES)
    
    foreach(subdir ${subdirs})
        _get_all_cmake_targets(subdir_targets ${subdir})
    
        foreach(subtar ${subdir_targets})
            get_target_property(target_type ${subtar} TYPE)            
            list(APPEND targets ${subtar})
        endforeach()
    
    endforeach()
    
    set(${out_var} ${targets} PARENT_SCOPE)

endfunction()
    
 
function(enAddAlwaysTargets)
    
    _get_all_cmake_targets(all_targets ${CMAKE_SOURCE_DIR})

#    add_custom_target(en_export  command "git archive d:/source/TEMP " WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} )
#    add_custom_target(en_import  command "git" WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})

    add_custom_target(do_always_before ALL command ${CMAKE_COMMAND} 
       -DenROOT_DIR=${CMAKE_SOURCE_DIR}
        -DenIsMSW=${enIsMSW} 
      -DenIsClang=${enIsClang}
      -DenMS_MT_EXE=${enMS_MT_EXE}
    -P ${CMAKE_SOURCE_DIR}/public/core/build-before.cmake WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} )  

    add_custom_target(do_always_after  ALL command ${CMAKE_COMMAND} 
       -DenROOT_DIR=${CMAKE_SOURCE_DIR}
        -DenIsMSW=${enIsMSW} 
      -DenIsClang=${enIsClang}
      -DenMS_MT_EXE=${enMS_MT_EXE}
    -P ${CMAKE_SOURCE_DIR}/public/core/build-after.cmake WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} )   

    foreach(subtar ${all_targets})
        if (NOT ${subtar} STREQUAL "uninstall")
            add_dependencies(do_always_after ${subtar})
            add_dependencies(${subtar} do_always_before)
        endif()
    endforeach()

endfunction()

