
#!/bin/bash
#-----------------------|DOCUMENTATION|-----------------------#
# @descr: Deployment script for the production environment.
# @example:
#    $ bash deploy-dev.sh

source "$PWD/environment/production/deploy.sh";

# @descr: Call of execution of the script's main function.
RunningProductionEnvironment "$@" 2>&1 | tee ./builds/deploy-prod.log;

# @descr: Finishing the script!!! :P
exit 0;
