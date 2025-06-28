#!/bin/bash

sudo apt install --reinstall linux-image-generic -y
sudo apt-get install openvswitch-switch-dpdk -y

sudo touch /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg

sudo echo "network: {config: disabled}" > /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
