#!/usr/bin/env bash

vagrant up

vagrant upload ./install_minikube.sh /opt/install_minikube.sh
vagrant ssh -- -t "/opt/install_minikube.sh"

