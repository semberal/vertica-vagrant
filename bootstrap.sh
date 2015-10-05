#!/bin/bash

# sudo apt-get update
sudo apt-get install -y ansible
ansible-playbook -i localhost, -c local -s /home/vagrant/ansible-playbooks/playbook.yaml
echo
echo
echo
echo "******************************************"
echo "** INSTALLATION COMPLETED SUCCESSFULLY! **"
echo "******************************************"
echo
echo "Everything has been configured, please follow these steps to connect to the Vertica database:"
echo "* vagrant ssh"
echo "* sudo su dbadmin"
echo "* vsql"
echo "OR"
echo "* adminTools"
