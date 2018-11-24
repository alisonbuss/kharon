# kharon
Projeto de ambiente básico DevOps.

> **Nota:**
> - **Status do Projeto:** Em estagio inicial, elaborando o conceito de um ambiente DevOps.
>

```text

Projetos:

  kharon

  --IMAGE
  kharon-coreos-packer
  kharon-ubuntu-packer
  kharon-centos-packer

  --INFRA
  kharon-kubernetes-vagrant
  kharon-kubernetes-terraform
  kharon-storage-vagrant
  kharon-storage-terraform

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

Fluxo da implantação:

  >> Packer 
    >> Terraform/Vagrant
      >> Machines(IPs) 
        >> Ansible 
          >> Kubernetes 
            >> Services 
              >> ``Kharon IaC!!!´´


  - Makefile - ENVIRONMENT VARIABLES

      - SYSTEM=coreos            # (CoreOS, CentOS, Ubuntu)
      - PLATFORM=vagrant         # (vagrant, aws, google, digitalocean)
      - ENVIRONMENT=development  # (development, staging, production)

  - Makefile - Packer

      - publish-image-coreos
      - publish-image-centos
      - publish-image-ubuntu

  - Makefile - Terraform

      - machines-plan
      - machines-status
      - machines-up
      - machines-reload
      - machines-off
      - machines-destroy
      - machines-test

  - Makefile - Ansible

      - provide-ping
      - provide-setup
      - provide-reboot
      - provide-info
      - provide-test

  - Makefile - Ansible - kubernetes

      - provide-k8s-admin-client
      - provide-k8s-basic-environment
      - provide-k8s-cluster-etcd
      - provide-k8s-cluster-master
      - provide-k8s-cluster-worker
      - provide-k8s-new-member-etcd
      - provide-k8s-new-member-master
      - provide-k8s-new-member-worker
      - provide-kubernetes

  - Makefile - Ansible - kubernetes - Service

      - provide-kubernetes-services

  - Makefile - Ansible - kubernetes - Business

      - provide-kubernetes-business


machine:
  system: [coreos, ubuntu, centos],
  size: [micro, small, medium, big],

versions depen:
  vagrant: "2.0.1"
  terraform: "0.11.1"
  packer: "1.1.3"
  ansible: "2.6.1"

versions:
  coreos: "1967.0.0"
  ubuntu: "18.04.1"
  centos: "7.5.1804"
  k8s: "1.10.0"
  etcd: "3.2.15"
  rkt: "1.30.0"
  docker: "18.04.0"
  flannel: "0.10.0"
  peervpn: "0-044"
  ceph: "10.1.1"



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

```










