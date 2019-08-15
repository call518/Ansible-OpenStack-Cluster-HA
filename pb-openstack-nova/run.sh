#!/bin/bash

ansible-playbook -i inventory.lst openstack-nova-controller.yml --tags controller
if [ $? -ne 0 ]; then exit 99; fi

ansible-playbook -i inventory.lst openstack-nova-compute.yml --tags network-br-ex,ceph-client,compute
if [ $? -ne 0 ]; then exit 99; fi

ansible-playbook -i inventory.lst openstack-nova-novnc.yml --tags novnc
if [ $? -ne 0 ]; then exit 99; fi

