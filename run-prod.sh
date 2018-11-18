#!/bin/bash
#-----------------------|DOCUMENTATION|-----------------------#
# @descr: 
# @example:
#  
#-------------------------------------------------------------#

# @descr: Main function of the script, it runs automatically on the script call.
# @param: 
#    $@ | array: (*)
function RunningProductionEnvironment {
    
}

# @descr: Call of execution of the script's main function.
RunningProductionEnvironment "$@" 2>&1 | tee ./builds/run-prod.log;

# @descr: Finishing the script!!! :P
exit 0;
