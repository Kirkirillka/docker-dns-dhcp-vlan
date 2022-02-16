#!/bin/bash

# additional packages
apt-get update
apt-get install -y python3-pip vlan tcpdump

# ensure vlan driver enabled
modprobe 8021q


cat > /etc/netplan/60-vlan.yaml <<EOF
network:
  version: 2
  renderer: networkd
  ethernets:
    eth2:
      match:
        name: eth2
  vlans:
    vlan.10:
      id: 10
      link: eth2
      dhcp4: no
      addresses: [ 10.0.45.11/24 ]
EOF

netplan generate
netplan apply