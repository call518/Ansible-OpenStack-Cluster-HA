#!/bin/bash

# Install Requirements
ansible-playbook -i inventory.lst galera.yml --tags setup
if [ $? -ne 0 ]; then exit 99; fi

# Config Galera Cluster
ansible-playbook -i inventory.lst galera.yml --skip-tags setup 
if [ $? -ne 0 ]; then exit 99; fi
