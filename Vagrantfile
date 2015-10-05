# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6.5"

VERTICA_DEB_PATH = "./vertica.deb"
ANSIBLE_PLAYBOOKE_PATH = "./ansible-playbooks"

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |provider|
    provider.customize ["modifyvm", :id, "--cpus", "2", "--memory", "4096"]
    provider.destroy_unused_network_interfaces = true
  end

  config.vm.network "forwarded_port", guest: 5433, host: 5433

  config.vm.provision "file", source: VERTICA_DEB_PATH, destination: "/tmp/vertica.deb"

  config.vm.provision "file", source: ANSIBLE_PLAYBOOKE_PATH, destination: "/home/vagrant"

  config.vm.provision "shell", path: "bootstrap.sh"

end
