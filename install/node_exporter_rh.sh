#! /bin/bash

sudo adduser -M -r -s /sbin/nologin node_exporter
sudo dnf install wget -y

cd /usr/src/

sudo wget https://github.com/prometheus/node_exporter/releases/download/v1.6.0/node_exporter-1.6.0.linux-amd64.tar.gz

sudo tar -xf node_exporter-1.6.0.linux-amd64.tar.gz

sudo mv node_exporter-*/node_exporter /usr/bin

if ! command -v node_exporter &> /dev/null; then
    echo "node_exporter not found!"
    exit 1
fi

if ! node_exporter --version &> /dev/null; then
    echo "--version caused error"
    exit 1
fi

echo "node_exporter installed, keep going"

cat <<EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

echo "[INFO] UNIT node_exporter.service CREATED."

sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter

if ! systemctl is-active --quiet node_exporter; then
    echo "ERROR WITH UNIT"
    exit 1
fi

echo "No problem with unit"
sudo rm node_exporter-1.6.0.linux-amd64.tar.gz
