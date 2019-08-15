#!/bin/bash

ansible-playbook -i inventory.lst zookeeper-cluster.yml
if [ $? -ne 0 ]; then exit 99; fi
