
#!/bin/bash
#-----------------------|DOCUMENTATION|-----------------------#
# @descr: Deployment script for the development environment.
# @example:
#    $ bash deploy-dev.sh

source "$PWD/environment/development/deploy.sh";

# @descr: Call of execution of the script's main function.
RunningDevelopmentEnvironment "$@" 2>&1 | tee ./builds/deploy-dev.log;

# @descr: Finishing the script!!! :P
exit 0;
