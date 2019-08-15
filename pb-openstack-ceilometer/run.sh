#!/bin/bash

ansible-playbook -i inventory.lst openstack-ceilometer-controller.yml --tags controller
if [ $? -ne 0 ]; then exit 99; fi

ansible-playbook -i inventory.lst openstack-ceilometer-compute.yml --tags compute
if [ $? -ne 0 ]; then exit 99; fi

