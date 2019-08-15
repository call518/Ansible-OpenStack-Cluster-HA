#!/bin/bash

ansible-playbook -i inventory.lst openstack-neutron-controller.yml --tags controller
if [ $? -ne 0 ]; then exit 99; fi

ansible-playbook -i inventory.lst openstack-neutron-network.yml --tags network-br-ex,network
if [ $? -ne 0 ]; then exit 99; fi

ansible-playbook -i inventory.lst openstack-neutron-compute.yml --tags network-br-ex,compute
if [ $? -ne 0 ]; then exit 99; fi

