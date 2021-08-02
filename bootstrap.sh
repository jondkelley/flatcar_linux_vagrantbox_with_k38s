#!/bin/bash

# https://github.com/biggers/vagrant-kubernetes-by-k3s

echo nameserver 8.8.8.8 | sudo tee /run/systemd/resolve/resolv.conf

echo -e "DNSStubListener=no\nDNS=8.8.8.8\nCache=no\nLLMNR=no"  | sudo tee /etc/systemd/resolved.conf1
cat /etc/systemd/resolved.conf1 >> /etc/systemd/resolved.conf
sudo systemctl restart systemd-resolved
sudo systemctl stop docker
sudo systemctl start docker
sudo echo '{"dns": ["8.8.8.8"],"dns-opts":["use-vc"],"dns-search": ["home.lan"]}' > /etc/docker/daemon.json

# systemctl restart systemd-resolved && systemctl restart systemd-networkd
# /etc/systemd/resolved.conf
# systemd-resolve --status

curl -sfL https://get.k3s.io | sudo sh -
# cd /opt
# curl -sLS https://get.k3sup.dev  --output k3sup
# sudo install k3sup /opt/bin/

# export IP=192.168.33.11
# sudo /opt/bin/k3sup install --ip $IP --user core
# sudo cp /tmp/k3sup /opt/bin/k3sup
# sudo /opt/bin/k3sup install --ip $IP --user core
# ##sudo cp k3sup /usr/local/bin/k3sup
