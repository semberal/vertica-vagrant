# vertica-vagrant

This repository contains Ansible playbooks for the [HP Vertica](http://www.vertica.com/) database running in VirtualBox. Vagrant is used to deploy the VM instance. Getting started with HP Vertica is now as simple as `vagrant up`!

## Prerequisites
* Ansible
* Vagrant
* VirtualBox

## Installation
* Clone this repository `git clone git@github.com:semberal/vertica-vagrant.git`.
* Download [HP Vertica 7.1.x community edition](https://my.vertica.com/download-community-edition/) for Ubuntu 14.04 LTS (registration required).
* Rename the downloaded archive to *vertica.deb* and place it to the cloned git repository.
* Run `vagrant up` to create, launch and provision a VirtualBox instance.
* Once the provisioning has finished, you can connect to the newly created virtual instance using `vagrant ssh`.
* Switch to the Vertica database administrator system user account `sudo su dbadmin`.
* Now you are ready to start playing with the database. There are `vsql` and `adminTools` bash aliases you can use right away.

## Limitations
* Currently only single node deployment is supported. Even though it is not going to be complicated to deploy a Vertica cluster of three (or more) nodes, a machine with at least 32G of memory would be required.