#!/bin/bash

sudo apt-get install -y \
    software-properties-common \
    apt-transport-https

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt-get update
sudo apt-get install -y code
