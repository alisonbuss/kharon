# kharon
Projeto de ambiente básico DevOps.

> **Nota:**
> - **Status do Projeto:** Em estagio inicial, elaborando o conceito de um ambiente DevOps.
>

```text

-----------------------------------------------
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


-----------------------------------------------
machine:
  system: [coreos, ubuntu, centos],
  size: [micro, small, medium, big],


-----------------------------------------------
versions depen:
  vagrant: "2.0.1"
  packer: "1.1.3"
  terraform: "0.11.1"
  ansible: "2.6.1"


-----------------------------------------------
versions image:
  coreos: "1967.0.0"
  ubuntu: "18.04.1"
  centos: "7.5.1804"

versions back-end:
  k8s: "1.10.0"
  etcd: "3.2.15"
  rkt: "1.30.0"
  docker: "18.04.0"
  flannel: "0.10.0"
  peervpn: "0-044"
  ceph: "10.1.1"

versions front-end:
  rook: "0.8.3"
  calico-canal: ""
  kube-router: ""
  traefik: ""
  kube-web-ui: ""
  netdata: ""
  prometheus: "" 
  grafana: ""
  graylog: ""
  jenkins: ""
  rocket-chat: ""
  kharon-cocoon: ""


-----------------------------------------------
Fluxo da implantação:

  >> Packer 
    >> Terraform/Vagrant
      >> Machines(IPs) 
        >> Ansible 
          >> Kubernetes 
            >> Services 
              >> ``Kharon IaC!!!´´


-----------------------------------------------
Makefile:

  - Makefile - ENVIRONMENT VARIABLES

      - MACHINES=./machines.json  # (Boot structure of all machines in the cluster)
      - PLATFORM=vagrant          # (vagrant, aws, google, digitalocean)
      - ENVIRONMENT=development   # (development, staging, production)

  - Makefile - Packer

      - publish-image-coreos
      - publish-image-centos
      - publish-image-ubuntu

  - Makefile - Terraform/Vagrant

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

      - provide-admin-client
      - provide-cluster-all
      - provide-cluster-etcd
      - provide-cluster-master
      - provide-cluster-worker
      - provide-new-member-etcd
      - provide-new-member-master
      - provide-new-member-worker

  - Makefile - Ansible - kubernetes - Service

      - provide-network-policy
      - provide-monitoring
      - provide-backup
      - provide-continuous-integration
      - provide-kubernetes-web-ui


-----------------------------------------------
--kharon
----builds
----documentation
----image
-------kharon-coreos-packer
----------templates
----------environments
----------provision
----------Makefile
----------README.md
-------kharon-ubuntu-packer
-------kharon-centos-packer
-------Makefile
-------README.md
----infrastructure
-------kharon-kubernetes-vagrant
-------kharon-kubernetes-terraform
-------kharon-storage-vagrant
-------kharon-storage-terraform
----------global
----------system
----------platforms
----------resources
----------environments
----------Makefile
----------README.md
-------Makefile
-------README.md
----configuration
-------kharon-kubernetes-ansible
-------kharon-ceph-storage-ansible
-------kharon-etcd-backup-ansible
-------Makefile
-------README.md
----services
-------kharon-kubernetes-services-ansible
-------Makefile
-------README.md
----.gitignore
----LICENSE
----Makefile
----README.md
----kharon.sh
----machines.json


$ sh kharon data ls
$ sh kharon vagrant -v
$ sh kharon terraform -v
$ sh kharon ansible -v
$ sh kharon packer -v
$ sh kharon etcdctl -v
$ sh kharon kubectl -v
$ sh kharon kubernetic -v























https://github.com/stylelab-io/kubernetes-coreos-terraform
https://github.com/rook/rook/releases
https://rook.io/docs/rook/v0.8/
https://jujucharms.com/kubernetes
https://jujucharms.com/

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










