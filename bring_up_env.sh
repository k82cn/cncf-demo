#!/usr/bin/env bash

vagrant up

vagrant ssh -- -t "sudo mkdir -p /opt/cncf-demo && sudo chown vagrant:vagrant /opt/cncf-demo"
vagrant upload ./install_minikube.sh /opt/cncf-demo/install_minikube.sh
vagrant ssh -- -t "/bin/bash /opt/cncf-demo/install_minikube.sh"

