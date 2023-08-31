#!/usr/bin/env bash

vagrant up

vagrant ssh -- -t "sudo mkdir -p /opt/cncf-demo && sudo chown vagrant:vagrant /opt/cncf-demo"

vagrant upload ./install_tools.sh /opt/cncf-demo/install_tools.sh
vagrant ssh -- -t "/bin/bash /opt/cncf-demo/install_tools.sh"

vagrant upload ./install_minikube.sh /opt/cncf-demo/install_minikube.sh
vagrant ssh -- -t "/bin/bash /opt/cncf-demo/install_minikube.sh"

vagrant upload ./install_argocd.sh /opt/cncf-demo/install_argocd.sh
vagrant ssh -- -t "/bin/bash /opt/cncf-demo/install_argocd.sh"

vagrant upload ./base /opt/cncf-demo/base
vagrant ssh -- -t "kubectl apply -k /opt/cncf-demo/base/vault"
vagrant ssh -- -t "kubectl apply -k /opt/cncf-demo/base/cert-mgr"
