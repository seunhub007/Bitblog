#!/bin/bash

# Add Docker's official GPG key:

sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

mkdir actions-runner && cd actions-runner
curl -o actions-runner-osx-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-osx-x64-2.311.0.tar.gz
echo "f4d8d1dd850fd0889e0d250c82fa587b0e21934f8441143ee6772284b2ae6211  actions-runner-osx-x64-2.311.0.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-osx-x64-2.311.0.tar.gz
echo -ne "\n" | ./config.sh --url https://github.com/seunhub007/Bitblog --token A4ZVN33YRSZSK6G5JW553ITFMJ4KA
./run.sh&