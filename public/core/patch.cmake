
function(enReplaceCheck enFile enSource enTarget enCheck)

    file(READ  "${enFile}" buff)

    if (${buff} MATCHES ".${enCheck}.")

        string(REPLACE ${enSource}  ${enTarget}   buff "${buff}")
        file(WRITE ${enFile} "${buff}")
        message(STATUS "bugfix: REPLACE from [${enSource}] to [${enTarget}]  with check exists [${enCheck}] in: ${enFile}  " )
    else()
        message(STATUS "bugfix: NOT REPLACE from [${enSource}] to [${enTarget}]  with check exists [${enCheck}] in: ${enFile}  " )
    endif()

endfunction()

function(enReplace enFile enSource enTarget)
    enReplaceCheck(${enFile} ${enSource} ${enTarget} ${enSource}) 
endfunction()
