#!/bin/bash

ansible-playbook -i inventory.lst openstack-cinder.yml
if [ $? -ne 0 ]; then exit 99; fi
