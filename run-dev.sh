#!/bin/bash
#-----------------------|DOCUMENTATION|-----------------------#
# @descr: 
# @example:
#  
#-------------------------------------------------------------#

# @descr: Main function of the script, it runs automatically on the script call.
# @param: 
#    $@ | array: (*)
function RunningDevelopmentEnvironment {
    
}

# @descr: Call of execution of the script's main function.
RunningDevelopmentEnvironment "$@" 2>&1 | tee ./builds/run-dev.log;

# @descr: Finishing the script!!! :P
exit 0;
