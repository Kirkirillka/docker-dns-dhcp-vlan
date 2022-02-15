apt-get update
apt-get install -y python3-pip vlan tcpdump
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
      addresses: [ 10.0.45.12/24 ]
    vlan.20:
      id: 20
      link: eth2
      dhcp4: no
      addresses: [10.0.55.240/24]
    vlan.30:
      id: 30
      link: eth2
      dhcp4: no
      addresses: [10.0.65.240/24]
EOF

netplan generate
netplan apply