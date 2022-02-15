# docker-dns-dhcp-vlan
Run DHCP/DNS as Docker container in mutli-VLAN configuration


- https://hicu.be/docker-networking-macvlan-vlan-configuration
- https://github.com/networkboot/docker-dhcpd

## DCHP-Docker

docker network  create  -d ipvlan  \
    --subnet=10.0.55.0/24 \
    -o parent=eth2.20 \
    vlan20

docker network  create  -d ipvlan  \
    --subnet=10.0.65.0/24 \
    -o parent=eth2.30 \
    vlan30

docker run --net=vlan20 --ip=10.0.55.20 --rm -it --entrypoint /bin/sh alpine

docker run --net=vlan20 --ip=10.0.55.30 --rm -it --entrypoint /bin/sh curlimages/curl

docker network rm vlan20


docker run --net=vlan20 --ip=10.0.55.30 -v $PWD/data:/data --rm dhcpd
docker network connect vlan30 --ip 10.0.65.30
a12933e24840de8cc94bb4942ef88347234126cc022d981db17bfc128bf1bdee

## DHCP-Client

docker network  create  -d macvlan \
    --subnet=10.0.55.0/24 \
    --gateway=10.0.55.10 \
    -o parent=eth2.20 \
    vlan20

docker run --net=vlan20 --ip=10.0.55.40 --rm -it --entrypoint /bin/sh alpine

docker network rm vlan20