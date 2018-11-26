#!/bin/bash
#-----------------------|DOCUMENTATION|-----------------------#
# @descr: 
# @example:

#       $ sh kharon help
#       $ sh kharon --help
#       $ sh kharon --state
#       $ sh kharon --dep
#       $ sh kharon --dep-install ubuntu
#       $ sh kharon --init
#       $ sh kharon --update
#       $ sh kharon --version




#       $ sh kharon help
#       $ sh kharon depen
#       $ sh kharon install ubuntu
#       $ sh kharon state
#       $ sh kharon vagrant -v
#       $ sh kharon terraform -v
#       $ sh kharon ansible --version
#       $ sh kharon packer -v
#       $ sh kharon etcdctl -v
#       $ sh kharon kubectl version
#       $ sh kharon kubernetic
#-------------------------------------------------------------#

function Kharon.help {
    local param="$@";
    echo "--> Kharon.help";
}

function Kharon.depen {
    local param="$@";
    echo "--> Kharon.depen";
    echo "INFO: The Kharon project has the following dependencies:";
    echo "[vagrant, terraform, ansible, packer, etcdctl, kubectl, kubernetic]";
}

function Kharon.install {
    local param="$@";
    echo "--> Kharon.install";
}

function Kharon.state {
    local param="$@";
    echo "--> Kharon.state";
    echo "----> Version: vagrant " && vagrant -v;
    echo "----> Version: terraform " && terraform -v;
    echo "----> Version: ansible " && ansible --version;
    echo "----> Version: packer " && packer -v;
    echo "----> Version: etcdctl " && etcdctl -v;
    echo "----> Version: kubectl " && kubectl version;
    #echo "----> Version: kubernetic " && kubernetic -v;
}

function Kharon.vagrant {
    local param="$@";
    
    echo "Kharon.vagrant ${param}";
}

function Kharon.terraform {
    local param="$@";
    
    echo "Kharon.terraform";
}

function Kharon.ansible {
    local param="$@";
    
    echo "Kharon.ansible";
}

function Kharon.packer {
    local param="$@";
    
    echo "Kharon.packer";
}

function Kharon.etcdctl {
    local param="$@";
    
    echo "Kharon.etcdctl";
}

function Kharon.kubectl {
    local param="$@";
    
    echo "Kharon.kubectl";
}

function Kharon.kubernetic {
    local param="$@";
    
    echo "Kharon.kubernetic";
}

# @descr: Main function of the script, it runs automatically on the script call.
# @param: 
#    $@ | array: (*)
function Kharon {
    case "$1" in
        help) { Kharon.help "$@"; };;
        depen) { Kharon.depen "$@"; };;
        install) { Kharon.install "$@"; };;
        state) { Kharon.state "$@"; };;
        vagrant) { Kharon.vagrant "$@"; };;
        terraform) { Kharon.terraform "$@"; };;
        ansible) { Kharon.ansible "$@"; };;
        packer) { Kharon.packer "$@"; };;
        etcdctl) { Kharon.etcdctl "$@"; };;
        kubectl) { Kharon.kubectl "$@"; };;
        kubernetic) { Kharon.kubernetic "$@"; };;
        *) {
            echo "WARNING: Action type is incorrect!";
            echo "ACTIONS: [help, depen, install, state, vagrant, terraform, ansible, packer, etcdctl, kubectl, kubernetic]";
        };;
    esac
}

# @descr: Call of execution of the script's main function.
Kharon "$@" 2>&1 | tee ./builds/kharon.log;

# @descr: Finishing the script!!! :P
exit 0;
