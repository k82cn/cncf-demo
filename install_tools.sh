#!/bin/bash

# download kubectl
curl -sSLO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install kubectl /usr/local/bin/kubectl
rm kubectl

echo "alias kc=kubectl" | tee -a ~/.bashrc

# install kustomize
curl -sSL "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
sudo install kustomize /usr/local/bin/
rm kustomize

# install helm
curl -sSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | sudo bash

# install argocd
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

# Download the binary
curl -sLO https://github.com/argoproj/argo-workflows/releases/download/v3.4.10/argo-linux-amd64.gz
gunzip argo-linux-amd64.gz
sudo install argo-linux-amd64 /usr/local/bin/argo
rm argo-linux-amd64

# kubectl create namespace argocd
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# install yq
curl -sSL -o yq_linux_amd64 https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 
sudo install yq_linux_amd64 /usr/bin/yq
rm yq_linux_amd64
