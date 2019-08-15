#!/bin/bash

ansible-playbook -i inventory.lst etc-hosts.yml
if [ $? -ne 0 ]; then exit 99; fi
