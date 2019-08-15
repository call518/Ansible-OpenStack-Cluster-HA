#!/bin/bash

CURR_PATH=$PWD
COLOR_ON="\033[1;33m"
COLOR_OFF="\033[0m"


echo
echo -n -e "${COLOR_ON}All playbooks will be run, Are you sure (y/n)? ${COLOR_OFF}"
read -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo
else
	echo "Bye~~~~~"
	exit 1
fi
echo

#################################
### Setup ansible env.
#################################

cd $CURR_PATH/env-ansible
./00-setup-ansible.sh
cd $CURR_PATH


#################################
### Run all ansible playbooks
#################################

PBs="
pb-etc-hosts
pb-common-env
pb-chrony-ntp
pb-galera-cluster
pb-pacemaker-cluster
pb-haproxy
pb-rabbitmq-cluster
pb-memcached
pb-zookeeper-cluster
pb-openstack-yum-repo
pb-openstack-keystone
pb-openstack-glance
pb-openstack-cinder
pb-openstack-nova
pb-openstack-neutron
pb-openstack-octavia
pb-openstack-gnocchi
pb-openstack-ceilometer
pb-openstack-aodh
pb-openstack-heat
pb-openstack-barbican
pb-openstack-horizon
pb-post-tasks
"

for PB in $PBs
do
  echo -e "${COLOR_ON}=================== [Start] Playbook - '$PB' ======================${COLOR_OFF}"
  cd $CURR_PATH/$PB
  ./run.sh
  if [ $? -ne 0 ]; then exit 100; fi
  echo -e "${COLOR_ON}=================== [End] Playbook - '$PB' ========================${COLOR_OFF}"
  echo
  echo
  cd $CURR_PATH
done

echo
echo -e "${COLOR_ON} +++++++++++++++++ Completed~~~~~~~~~~~~~ :) ++++++++++++++++++++++++++${COLOR_OFF}"
echo -e "${COLOR_ON} +++++++++++++++++ Completed~~~~~~~~~~~~~ :) ++++++++++++++++++++++++++${COLOR_OFF}"
echo -e "${COLOR_ON} +++++++++++++++++ Completed~~~~~~~~~~~~~ :) ++++++++++++++++++++++++++${COLOR_OFF}"
echo
