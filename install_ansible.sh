#!/bin/bash

echo "Updating"
sudo apt update

echo "Installing software-properties-common"
sudo apt install software-properties-common -y

echo "Adding ansible repositories"
sudo add-apt-repository --yes --update ppa:ansible/ansible

echo "Installing ansible"
sudo apt install ansible -y
