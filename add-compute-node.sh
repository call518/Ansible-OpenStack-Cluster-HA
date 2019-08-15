#!/bin/bash

CURR_PATH=$PWD
COLOR_ON="\033[1;33m"
COLOR_OFF="\033[0m"

PBs="
pb-etc-hosts
pb-common-env
pb-chrony-ntp
pb-openstack-yum-repo
pb-openstack-nova
pb-openstack-neutron
pb-openstack-ceilometer
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
echo
