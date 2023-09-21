#!/usr/bin/env bash

# ovs-vsctl add-br cncf-br

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
vagrant ssh -- -t "kustomize build --enable-helm /opt/cncf-demo/base/cert-mgr | kubectl apply -f -"

vagrant upload ./bash_aliases /home/vagrant/.bash_aliases



# Unseal Vault and persist the root-token & unseal-keys into secret.

# cluster_keys=$(kubectl exec vault-0 -n vault -- vault operator init -tls-skip-verify -key-shares=1 -key-threshold=1 -format=json)
# echo $cluster_keys | jq -r '.unseal_keys_b64[]' | kubectl create secret generic vault-unseal-keys --namespace vault --from-file=vault-unseal-key.0=/dev/stdin
# echo $cluster_keys | jq -r '.root_token' | kubectl create secret generic vault-root-token --namespace vault --from-file=token=/dev/stdin
