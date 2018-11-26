
#!/bin/bash
#-----------------------|DOCUMENTATION|-----------------------#
# @descr: Deployment script for the staging environment.
# @example:
#    $ bash deploy-dev.sh

source "$PWD/environment/staging/deploy.sh";

# @descr: Call of execution of the script's main function.
RunningTestEnvironment "$@" 2>&1 | tee ./builds/deploy-test.log;

# @descr: Finishing the script!!! :P
exit 0;
