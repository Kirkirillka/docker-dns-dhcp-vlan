# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.ssh.insert_key = false

  config.vm.define "dhcp_docker" do |dhcp_docker|
    dhcp_docker.vm.box = "bento/ubuntu-20.04"

    dhcp_docker.vm.network "private_network", ip: "192.168.33.11"
    dhcp_docker.vm.network "private_network", ip: "192.168.40.11", auto_config: false


    dhcp_docker.vm.provision "shell", path: "dhcp_docker_provision.sh"
  end

  config.vm.define "dhcp_client" do |dhcp_client|
    dhcp_client.vm.box = "bento/ubuntu-20.04"

    dhcp_client.vm.network "private_network", ip: "192.168.33.12"
    dhcp_client.vm.network "private_network", ip: "192.168.40.13", auto_config: false

    dhcp_client.vm.provision "shell", path: "dhcp_client_provision.sh"
  end
end
