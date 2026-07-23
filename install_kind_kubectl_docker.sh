#!/bin/bash

set -e

echo "updating packages.."
sudo apt update

echo "installing kind..."
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.32.0/kind-linux-amd64
chmod + ./kind
sudo mv ./kind /usr/local/bin/kind


echo "installing kubectl.."
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo "installing docker..."
sudo apt install docker.io

sudo usermod -aG docker $USER

newgrp docker

echo "checking installation..."
kind --version
kubectl --version
docker --version

echo "Installation completed..."
