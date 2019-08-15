#!/bin/bash

ansible-playbook -i inventory.lst haproxy.yml
if [ $? -ne 0 ]; then exit 99; fi
