#!/bin/bash

ansible-playbook -i inventory.lst ceph-single.yml
if [ $? -ne 0 ]; then exit 99; fi
