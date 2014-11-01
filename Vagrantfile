# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6.5"

VAGRANTFILE_API_VERSION = "2"

VERTICA_DEB_PATH = "~/Downloads/vertica_7.0.2-1_amd64.deb"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/precise64"

  config.vm.define "vertica_node" do |vertica_node|
    vertica_node.vm.network "private_network", ip: "192.168.111.111"

    # Customize the VirtualBox instance
    vertica_node.vm.provider "virtualbox" do |provider|
      provider.customize ["modifyvm", :id, "--cpus", "2", "--memory", "4096"]
    end
  end

  # Upload the Vertica deb package
  config.vm.provision "file", source: VERTICA_DEB_PATH, destination: "/tmp/vertica.deb"

  # Provision using ansible
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "./playbook.yaml"
    ansible.inventory_path = "./hosts"
    ansible.limit = 'all'
    ansible.verbose = 'vvvv'
  end

end
