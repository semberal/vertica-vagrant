# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.7.0" # todo could be lower?

VAGRANTFILE_API_VERSION = "2"

VERTICA_DEB_PATH = "./vertica.deb"
LOCALE_TMP_PATH = "/tmp/locale.vagrant.tmp"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  # Should be default, but seems to be necessary, anyway
  config.ssh.private_key_path = "~/.vagrant.d/insecure_private_key" 

  config.vm.define "vertica_node" do |vertica_node|
    vertica_node.vm.network "private_network", ip: "192.168.111.111"

    # Customize the VirtualBox instance
    vertica_node.vm.provider "virtualbox" do |provider|
      provider.customize ["modifyvm", :id, "--cpus", "2", "--memory", "4096"]
      provider.destroy_unused_network_interfaces = true
    end
  end

  # Upload the Vertica deb package
  config.vm.provision "file", source: VERTICA_DEB_PATH, destination: "/tmp/vertica.deb"
  # Upload locale configuration to the tmp dir
  config.vm.provision "file", source: "./config/etc/default/locale", destination: LOCALE_TMP_PATH
  # Move locale configuration from the tmp dir to the proper location (/etc/default/locale)
  config.vm.provision "shell", inline: "mv #{LOCALE_TMP_PATH} /etc/default/locale", privileged: true

  # Provision using ansible
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "./playbook.yaml"
    ansible.inventory_path = "./hosts"
    ansible.limit = 'all'
    # ansible.verbose = 'vvvv' # enable for debugging only
  end

end
