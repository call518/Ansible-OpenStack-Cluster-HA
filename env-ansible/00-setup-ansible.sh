#!/bin/bash

#yum -y install ansible
yum -y install ansible-2.4.2.0-2.el7.noarch

\cp -a /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg.bak_`date +%Y-%m-%d_%H-%M-%S`
\cp -a ansible.cfg /etc/ansible/ansible.cfg

#ansible-galaxy install nickhammond.logrotate
