#!/bin/bash
#-----------------------|DOCUMENTATION|-----------------------#
# @descr: 
# @example:
#  
#-------------------------------------------------------------#

# @descr: Main function of the script, it runs automatically on the script call.
# @param: 
#    $@ | array: (*)
function RunningTestEnvironment {
    
}

# @descr: Call of execution of the script's main function.
RunningTestEnvironment "$@" 2>&1 | tee ./builds/run-test.log;

# @descr: Finishing the script!!! :P
exit 0;
