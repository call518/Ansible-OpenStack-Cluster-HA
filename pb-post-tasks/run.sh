#!/bin/bash

ansible-playbook -i inventory.lst post-tasks.yml
if [ $? -ne 0 ]; then exit 99; fi
