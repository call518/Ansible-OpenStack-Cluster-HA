#!/bin/bash

ansible-playbook -i inventory.lst common-env.yml
if [ $? -ne 0 ]; then exit 99; fi
