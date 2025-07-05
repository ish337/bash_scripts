#!/bin/bash

sudo apt-get install --reinstall linux-image-generic -y
sudo apt-get install openvswitch-switch-dpdk -y

sudo touch /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg

echo "network: {config: disabled}" | sudo tee /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
