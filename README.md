# vertica-vagrant

This repository contains Ansible playbooks for the [HP Vertica](http://www.vertica.com/) analytical database running in VirtualBox. Vagrant is used to deploy the VM instance. 

Vertica is columnar analytical big data database from HP, getting a lot of traction recently. Unfortunately, the installation process is somewhat cumbersome, several system settings need to be tweaked and it isn't really easy to get up and running quickly to just try things. This project aims to provide resources to automate not only the installation process, but also deployment of a virtual machine, which you can play with and terminate at any moment. Getting started with HP Vertica is now as simple as `vagrant up`!

**Disclaimer:** Vertica is a big-data analytical platform which requires a lot resources to run at its best. The virtual instance presented here is configured to run with 4GB of memory and 2 dedicated CPUs and, therefore, is not suitable for anything beyond very simple educational use-cases. Virtual instance configuration can be changed in `Vagrantfile`.

## Prerequisites
* [Ansible](http://ansible.com/) - Installation process automation
* [Vagrant](http://vagrantup.com/) - VM creation, deployment and provisioning
* [VirtualBox](https://www.virtualbox.org/) - Hypervisor

## Installation
* Clone this repository `git clone git@github.com:semberal/vertica-vagrant.git`.
* Download [HP Vertica 7.1.x community edition](https://my.vertica.com/download-community-edition/) for Ubuntu 14.04 LTS (registration required).
* Rename the downloaded archive to *vertica.deb* and place it to the cloned git repository.
* Run `vagrant up` to create, launch and provision a VirtualBox instance.
* Once the provisioning has finished, you can connect to the newly created virtual instance using `vagrant ssh`.
* Switch to the Vertica database administrator system user account `sudo su dbadmin`.
* Now you are ready to start playing with the database. There are `vsql` and `adminTools` bash aliases you can use right away.

## F.A.Q.

### Can I run vertica-vagrant from Windows?

Unfortunately Ansible [does not support Windows](http://docs.ansible.com/intro_installation.html#control-machine-requirements) for the control machine. You can try [this guide](http://www.azavea.com/blogs/labs/2014/10/running-vagrant-with-ansible-provisioning-on-windows/), which shows how to run Vagrant with Ansible provisioner in Cygwin. However, I'haven't tried it yet and cannot guarentee is will work.

## Troubleshooting

### Connection timed out
Ansible seems not to be able to connect to the newly provisioned virtual instance during `vagrant up` from time to time:

```
GATHERING FACTS *************************************************************** 
fatal: [192.168.111.111] => SSH Error: ssh: connect to host 192.168.111.111 port 22: Connection timed out
    while connecting to 192.168.111.111:22
It is sometimes useful to re-run the command using -vvvv, which prints SSH debug output to help diagnose the issue.
```

If you run into such issue, just run:
```
vagrant provision --provision-with ansible`
```
I should finish successfully now.


