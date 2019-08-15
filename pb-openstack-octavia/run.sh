#!/bin/bash

ansible-playbook -i inventory.lst openstack-octavia-controller.yml --tags controller
if [ $? -ne 0 ]; then exit 99; fi

ansible-playbook -i inventory.lst openstack-octavia-network.yml --tags network
if [ $? -ne 0 ]; then exit 99; fi

