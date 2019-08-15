#!/bin/bash

# Bootstrapping Galera Cluster
ansible-playbook -i inventory.lst galera_bootstrap.yml
if [ $? -ne 0 ]; then exit 99; fi
