#!/bin/bash

set -e

# sudo apt-get update
sudo apt-get install -y ansible
ansible-playbook -i localhost, -c local -s /home/vagrant/ansible-playbooks/playbook.yaml
echo "******************************************"
echo "** INSTALLATION COMPLETED SUCCESSFULLY! **"
echo "******************************************"
echo "Everything has been configured, you can now connect to the Vertica database:"
echo "* Command line"
echo "*** vagrant ssh"
echo "*** sudo su dbadmin"
echo "*** vsql or adminTools"
echo "* JDBC"
echo "*** Host: localhost:5433"
echo "*** Database: default"
echo "*** Username: dbadmin"
echo "*** Password: (empty)"
echo "*** JDBC URI: jdbc:vertica://localhost:5433/default"
