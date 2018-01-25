#!/bin/bash

#-----------------------|DOCUMENTATION|-----------------------#
# @descr: Script de inicialização de execução do projeto no terraform     
# @fonts:  
# @example: 
#    $ bash BigBang.sh (plan,apply,show,destroy) dev vagrant
#    $ bash BigBang.sh (plan,apply,show,destroy) test azure
#    $ bash BigBang.sh (plan,apply,show,destroy) prod aws
#-------------------------------------------------------------#

# spacial-station-gear
# Spacial Station - Projeto Basica DevOps

function startBigBang {
    local TERRAFORM=$(which terraform);
    local GLOBAL_VARS="../../globals.tfvars";
    local ENVIRONMENT_VARS="../environment.tfvars";
    local VARS="-var-file='${GLOBAL_VARS}' -var-file='${ENVIRONMENT_VARS}'";
    local OUTPUT_FILE="../account.tfvars";
    
    local COMMAND=$1;
    
    case ${COMMAND} in
        plan) { 
            rm -rf .terraform;
            $TERRAFORM get;
            $TERRAFORM $COMMAND $VARS;
        };;
        apply) { 
            rm -rf .terraform;
            $TERRAFORM get;
            $TERRAFORM $COMMAND $VARS;
            $TERRAFORM output | sed 's@= \(.*\)@= "\1"@g' > ...;
        };;
        show) { 
            $TERRAFORM $COMMAND;
        };;
        destroy) { 
            $TERRAFORM $COMMAND $VARS -force;
        };;
        *) {
            echo "";
        };;
    esac
} 

#startBigBang $1;

exit 0;