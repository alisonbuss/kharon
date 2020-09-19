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





coreos-packer
ubuntu-packer
centos-packer

cluster-vault-vagrant
cluster-vault-terraform
cluster-vault-ansible

cluster-kubernetes-vagrant
cluster-kubernetes-terraform
cluster-kubernetes-ansible

cluster-kafka-vagrant
cluster-kafka-terraform
cluster-kafka-ansible

cluster-traefik-vagrant
cluster-traefik-terraform
cluster-traefik-ansible

cluster-ceph-vagrant
cluster-ceph-terraform
cluster-ceph-ansible


kharon(ceph, vault, etcd, kafka, traefik, kubernetes)
  -kharon-packer
  -kharon-vagrant
  -kharon-terraform
  -kharon-ansible

  -kharon-image-coreos/
  -kharon-image-ubuntu/
  -kharon-image-centos/
  -kharon-ceph/
  -kharon-vault/
  -kharon-etcd/
  -kharon-kafka/
  -kharon-traefik/
  -kharon-kube/
      infrastructure/
      configuration/
      environment/



storage01.br.saopaulo.kharon.oi
security01.br.saopaulo.kharon.oi
etcd01.br.saopaulo.kharon.oi
kafka01.br.saopaulo.kharon.oi
traefik01.br.saopaulo.kharon.oi
kubernetes01.br.saopaulo.kharon.oi

storage01.eu.saopaulo.kharon.oi
security01.br.saopaulo.kharon.oi
etcd01.br.saopaulo.kharon.oi
kafka01.br.saopaulo.kharon.oi
traefik01.br.saopaulo.kharon.oi
kubernetes01.br.saopaulo.kharon.oi

storage01.us.saopaulo.kharon.oi
security01.br.saopaulo.kharon.oi
etcd01.br.saopaulo.kharon.oi
kafka01.br.saopaulo.kharon.oi
traefik01.br.saopaulo.kharon.oi
kubernetes01.br.saopaulo.kharon.oi



kharon
├── environment/
│   ├── development/
│   ├── homologation/
│   ├── production/
│   └── staging/
├── images/
│   ├── kharon-centos/
│   ├── kharon-coreos/
│   └── kharon-ubuntu/
├── platforms/
│   ├── kharon-ceph/
│   │   ├── configuration/
│   │   ├── environment/
│   │   └── infrastructure/
│   ├── kharon-etcd/
│   ├── kharon-kafka/
│   ├── kharon-kube/
│   ├── kharon-traefik/
│   └── kharon-vault/
├── services/
│   ├── kharon-kube-backup/
│   ├── kharon-kube-ci-cd/
│   ├── kharon-kube-monitoring/
│   ├── kharon-kube-network-policy/
│   └── kharon-kube-web-ui/
├── support-files/
├── LICENSE
├── Makefile
├── README.md
└── kharon.sh






kharon

    kharon-security-vault


    kharon-etcd-packer
    kharon-etcd-vagrant
    kharon-etcd-terraform
    kharon-etcd-ansible

        kharon-etcd-ca
        kharon-etcd


    kharon-kube-packer
    kharon-kube-vagrant
    kharon-kube-terraform
    kharon-kube-ansible

        kharon-client-cfssl
        kharon-client-kubectl
        kharon-client-kubernetic

        kharon-environment-variable
        kharon-optimize-system
        kharon-peervpn-network
        kharon-security-basic
        kharon-security-iptables

        kharon-rkt
        kharon-docker
        kharon-flannel
        
        kharon-kube-ca
        kharon-kube-configs
        kharon-kube-master
        kharon-kube-worker

        kharon-kube-service-rook
        kharon-kube-service-calico-canal
        kharon-kube-service-kube-router
        kharon-kube-service-web-ui
        kharon-kube-service-netdata
        kharon-kube-service-prometheus
        kharon-kube-service-grafana
        kharon-kube-service-graylog
        kharon-kube-service-graylog
        kharon-kube-service-logstash
        kharon-kube-service-rocket-chat


    kharon-kafka-packer
    kharon-kafka-vagrant
    kharon-kafka-terraform
    kharon-kafka-ansible


    kharon-traefik-packer
    kharon-traefik-vagrant
    kharon-traefik-terraform
    kharon-traefik-ansible


    kharon-ceph-packer
    kharon-ceph-vagrant
    kharon-ceph-terraform
    kharon-ceph-ansible
















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










