# vertica-vagrant

This repository contains Ansible playbooks for the [HP Vertica](http://www.vertica.com/) database running in VirtualBox. Vagrant is used to deploy the VM instance. Getting started with HP Vertica is now as simple as `vagrant up`!

## Prerequisites
* Ansible
* Vagrant
* VirtualBox

## Installation
* Download [HP Vertica 7.1.x community edition](https://my.vertica.com/download-community-edition/) for Ubuntu 14.04 LTS (registration required).
* Rename the downloaded *deb* package to *vertica.deb* and place it to the _vertica-vagrant_ project directory (next to the _Vagrantfile_).
* Run {{vagrant up}} to create, launch and provision the virtual instance.
* Once you vertica machine has been provisioned and started, connect to it: `vagrant ssh` and then `sudo su dbadmin`.
* Ansible created two aliases: `vsql` and `adminTools` you can use right away.


## How it works?

When you execute `vagrant up`, a new Ubuntu virtual machine is created. Using the Vagrant file provisioner, the package `vertica.deb` is copied into

## Limitations
* Currently only single node deployment is supported. Even though it is not going to be complicated to deploy a Vertica cluster of three (or more) nodes, a machine with at least 32G of memory would be required.