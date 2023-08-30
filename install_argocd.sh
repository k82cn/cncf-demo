#!/bin/bash

# Install argo-cd & argo-workflow
helm repo add argo https://argoproj.github.io/argo-helm
helm install -n argocd --create-namespace argo-workflows argo/argo-workflows
helm install -n argocd --create-namespace argo-cd argo/argo-cd

#TODO: waiting for Pod to be ready
