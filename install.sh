#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install zsh unzip jq
sudo apt-get autoremove

# Change to ZSH
sudo chsh -s $(which zsh)

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Terraform
LATEST_RELEASE=$(curl https://api.github.com/repos/hashicorp/terraform/releases/latest | jq --raw-output '.tag_name' | cut -c 2-)
if [[ ! -e ${LATEST_RELEASE} ]]; then
   rm /usr/local/bin/terraform
   wget https://releases.hashicorp.com/terraform/${LATEST_RELEASE}/terraform_${LATEST_RELEASE}_linux_amd64.zip
   sudo unzip terraform_${LATEST_RELEASE}_linux_amd64.zip -d /usr/local/bin/
   rm terraform_${LATEST_RELEASE}_linux_amd64.zip
fi