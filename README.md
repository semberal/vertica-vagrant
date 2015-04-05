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