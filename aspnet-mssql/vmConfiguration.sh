#!/bin/bash
#
# VM Configuration commands
# This list of commands is for reference only 
# commands require manual intervention.
#

sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Specific docker compose version
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# Azure Agent config
mkdir myagent && cd myagent
wget https://vstsagentpackage.azureedge.net/agent/2.210.1/vsts-agent-linux-x64-2.210.1.tar.gz
tar zxvf vsts-agent-linux-x64-2.210.1.tar.gz
./config.sh
# Y
# https://dev.azure.com/samuel1987/
# PAT
# <token> xumstryn26upppjlacze46inyxusrj67wlsf3bh36eg25xh4w3va
# VMProd1/VMProd2
# VMProd1/VMProd2
# _work

./run.sh

