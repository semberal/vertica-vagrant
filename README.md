# vertica-vagrant

[![Join the chat at https://gitter.im/semberal/vertica-vagrant](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/semberal/vertica-vagrant?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This repository contains Ansible playbooks for the [HPE Vertica](http://www.vertica.com/) analytical database running in VirtualBox. Vagrant is used to deploy the VM instance.

Vertica is columnar analytical big data database from HPE, getting a lot of traction recently. Unfortunately, the installation process is somewhat cumbersome, several system settings need to be tweaked and it isn't really easy to get up and running quickly to just try things. This project aims to provide resources to automate not only the installation process, but also deployment of a virtual machine, which you can play with and terminate at any moment. Getting started with HPE Vertica is now as simple as `vagrant up`!

**Disclaimer:** Vertica is a big-data analytical platform which requires a lot resources to run at its best. The virtual instance presented here is configured to run with 4GB of memory and 2 dedicated CPUs and, therefore, is not suitable for anything beyond very simple educational purposes. Virtual instance settings can be changed in `Vagrantfile`.

**Versioning note:** The current installation and configuration procedure is compatible with Vertica 7.2.x. If you are interested in older versions of Vertica, please checkout the appropriate git branch.


## Features

* Complete installation of Vertica is automated, the user can ssh to the guest machine and run `vsql` right away.
* Very few requirements for the host machine, only Vagrant and VirtualBox are required. Ansible [does not need to be installed on the host machine](https://github.com/semberal/vertica-vagrant/pull/2) anymore.
* Remote connections from the host machine **using various GUI tools** are supported.
* Works on all platforms which can run Vagrant and VirtualBox (GNU/Linux, Microsoft Windows, OS X, ...).


## Prerequisites

* [Vagrant](http://vagrantup.com/) - VM creation, deployment and provisioning
* [VirtualBox](https://www.virtualbox.org/) - Hypervisor


## Installation

* Clone this repository `git clone git@github.com:semberal/vertica-vagrant.git`.
* Download [HPE Vertica 7.2.x community edition](https://my.vertica.com/download-community-edition/) for Ubuntu 14.04 LTS (registration required).
* Rename the downloaded archive to *vertica.deb* and place it to the cloned git repository.
* Run `vagrant up` to create, launch and provision a VirtualBox instance.
* Once the provisioning has finished, you can connect to the newly created virtual instance using `vagrant ssh`.
* Switch to the Vertica database administrator system user account `sudo su dbadmin`.
* Now you are ready to start playing with the database. There are `vsql` and `adminTools` bash aliases you can use right away.
* Alternatively, you can install a GUI tool like [DBeaver](http://dbeaver.jkiss.org/), [DBVisualizer](https://www.dbvis.com/), or any other you prefer, and connect to the Vertica database from the host machine:
  * Host: "localhost:5433" (port is forwarded from the guest machine using Vagrant)
  * Database: "default"
  * Username: "dbadmin"
  * Password: ""
  * JDBC URI: "jdbc:vertica://localhost:5433/default"
* You can destroy the virtual instance anytime using `vagrant destroy`.


## How it works?

First, Vagrant creates a new VirtualBox machine with Ubuntu 14.04 LTS. Vagrant file provisioner then uploads the Vertica DEB package and the directory with Ansible playbooks. In the next step, Vagrant shell provisioner installs Ansible on the guest machine and runs the playbooks, which install and configure Vertica, as well as its dependencies.

This is the reason why Ansible does not have to be installed on the host machine anymore. You can, therefore, enjoy vertica-vagrant also on Microsoft Windows (which Ansible [does not support](http://docs.ansible.com/intro_installation.html#control-machine-requirements)).
