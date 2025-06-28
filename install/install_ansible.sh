#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
RESET="\e[0m"

echo -e "${GREEN}Updating${RESET}"
sudo apt update

echo -e "${GREEN}Installing software-properties-common${RESET}"
sudo apt install software-properties-common -y

echo -e "${GREEN}Adding ansible repositories${RESET}"
sudo add-apt-repository --yes --update ppa:ansible/ansible

echo -e "${GREEN}Installing ansible${RESET}"
sudo apt install ansible -y
