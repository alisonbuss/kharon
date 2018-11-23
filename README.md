# kharon
Projeto de ambiente básico DevOps.

> **Nota:**
> - **Status do Projeto:** Em estagio inicial, elaborando o conceito de um ambiente DevOps.
>


kharon

--IMAGE
kharon-coreos-packer
kharon-ubuntu-packer
kharon-centos-packer

--INFRA
kharon-kubernetes-vagrant
kharon-kubernetes-terraform

--CONFG
kharon-kubernetes-ansible
kharon-ceph-storage-ansible
kharon-etcd-backup-ansible

--SERVICE
kharon-kubernetes-services-ansible
--provide-network-policy
--provide-monitoring
--provide-backup
--provide-continuous-integration
--provide-kubernetes-web-ui






kharon-coreos-packer
kharon-ubuntu-packer
kharon-centos-packer
kharon-kubernetes-vagrant
kharon-kubernetes-terraform
kharon-kubernetes-ansible
kharon-storage-vagrant
kharon-storage-terraform
kharon-ceph-storage-ansible
kharon-kubernetes-services-ansible
--provide-network-policy
--provide-monitoring
--provide-storage
--provide-continuous-integration
--provide-kubernetes-web-ui



cluster-coreos-kubernetes-vagrant
cluster-coreos-kubernetes-ansible

kubernetes-services-ansible
--provide-network-policy
--provide-monitoring
--provide-continuous-integration
--provide-kubernetes-web-ui

OU

kubernetes-web-ui-ansible
kubernetes-network-policy-ansible
kubernetes-monitoring-ansible
kubernetes-continuous-integration-ansible


cluster-coreos-kubernetes-vagrant
cluster-coreos-kubernetes-ansible



--kharon
----builds
----documentation
----image
-------coreos-packer
----------templates
----------environments
----------provision
----------README.md
-------ubuntu-packer
-------centos-packer
-------Makefile
-------README.md
----infrastructure
-------global
-------system
-------platforms
-------resources
-------environments
-------Makefile
-------README.md
----provisioning
-------Makefile
-------README.md
----provisioners
-------cluster-kubernetes
-------monitoring-services
-------continuous-integration-services
-------publish-business
-------README.md
----.gitignore
----LICENSE
----Makefile
----README.md
----README_LANG_EN.md
----kharon

$ sh kharon data ls
$ sh kharon vagrant -v
$ sh kharon terraform -v
$ sh kharon ansible -v
$ sh kharon packer -v
$ sh kharon etcdctl -v
$ sh kharon kubectl -v
$ sh kharon kubernetic -v













https://github.com/stylelab-io/kubernetes-coreos-terraform

 ██ ▄█▀ ██░ ██  ▄▄▄       ██▀███   ▒█████   ███▄    █ 
 ██▄█▒ ▓██░ ██▒▒████▄    ▓██ ▒ ██▒▒██▒  ██▒ ██ ▀█   █ 
▓███▄░ ▒██▀▀██░▒██  ▀█▄  ▓██ ░▄█ ▒▒██░  ██▒▓██  ▀█ ██▒
▓██ █▄ ░▓█ ░██ ░██▄▄▄▄██ ▒██▀▀█▄  ▒██   ██░▓██▒  ▐▌██▒
▒██▒ █▄░▓█▒░██▓ ▓█   ▓██▒░██▓ ▒██▒░ ████▓▒░▒██░   ▓██░
▒ ▒▒ ▓▒ ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ▒░▒░▒░ ░ ▒░   ▒ ▒ 
░ ░▒ ▒░ ▒ ░▒░ ░  ▒   ▒▒ ░  ░▒ ░ ▒░  ░ ▒ ▒░ ░ ░░   ░ ▒░
░ ░░ ░  ░  ░░ ░  ░   ▒     ░░   ░ ░ ░ ░ ▒     ░   ░ ░ 
░  ░    ░  ░  ░      ░  ░   ░         ░ ░           ░ 
                                                      


   ▄█   ▄█▄    ▄█    █▄       ▄████████    ▄████████  ▄██████▄  ███▄▄▄▄   
  ███ ▄███▀   ███    ███     ███    ███   ███    ███ ███    ███ ███▀▀▀██▄ 
  ███▐██▀     ███    ███     ███    ███   ███    ███ ███    ███ ███   ███ 
 ▄█████▀     ▄███▄▄▄▄███▄▄   ███    ███  ▄███▄▄▄▄██▀ ███    ███ ███   ███ 
▀▀█████▄    ▀▀███▀▀▀▀███▀  ▀███████████              ███    ███ ███   ███ 
  ███▐██▄     ███    ███     ███    ███ ▀███████████ ███    ███ ███   ███ 
  ███ ▀███▄   ███    ███     ███    ███   ███    ███ ███    ███ ███   ███ 
  ███   ▀█▀   ███    █▀      ███    █▀    ███    ███  ▀██████▀   ▀█   █▀  
  ▀                                       ███    ███                      


 _   _    _   _       ___   _____    _____   __   _  
| | / /  | | | |     /   | |  _  \  /  _  \ |  \ | | 
| |/ /   | |_| |    / /| | | |_| |  | | | | |   \| | 
| |\ \   |  _  |   / / | | |  _  /  | | | | | |\   | 
| | \ \  | | | |  / /  | | | | \ \  | |_| | | | \  | 
|_|  \_\ |_| |_| /_/   |_| |_|  \_\ \_____/ |_|  \_| 