#!/usr/bin/env bash

# download minikube binary.
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube


# start minkube
minikube start

