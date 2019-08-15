#!/bin/bash

# Rolling-Update Galera Cluster
ansible-playbook -i inventory.lst galera_rolling_update.yml
if [ $? -ne 0 ]; then exit 99; fi
