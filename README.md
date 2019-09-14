# Ansible Playbooks for High-Availability OpenStack Cluster

This ``Ansible Playbooks`` can depploy ``OpenStack Cluster with HA automatically``.

Contact to me: call518@gmail.com :)

# Pre-Requirements

* Tested Ansible Version: ``ansible-2.4.2.0-2.el7.noarch``
* Supported Linux is ``CentOS7(x86_64)``
* Needed Root Permisson /w ``SSH-Key Auth``.
* ``Node-Name`` in inventory.lst file **must be same** with result of ``hostname`` command on Each Node.
* Back-End Storage is ``CEPH``. (Default)

# Playbooks

* ``pb-etc-hosts``
  * Setup /etc/hosts file.
* ``pb-common-env``
  * Setup Common Envirinments.
* ``pb-chrony-ntp``
  * Setup NTP for Cluster TIme-Sync
* ``pb-galera-cluster``
  * Setup MariaDB Galera Cluster.
    * Init
    * Bootstrap
    * Rolling-Update
* ``pb-pacemaker-cluster``
  * Setup Virtual-IP for HA/LB
* ``pb-haproxy``
  * Setup HAProxy.
* ``pb-rabbitmq-cluster``
  * Setup RabbitMQ Cluster.
* ``pb-memcached``
  * Setup Memcached.
* ``pb-zookeeper-cluster``
  * Setup Zookeeter Cluster.
* ``pb-openstack-yum-repo``
  * Setup OpenStack YUM Repository.
* ``pb-openstack-keystone``
  * Setup OpenStack Keystone.
* ``pb-openstack-glance``
  * Setup OpenStack Glance
    * Glance-API
    * Glance-Registry
* ``pb-openstack-cinder``
  * Setup OpenStack Cinder (Backend is CEPH)
* ``pb-openstack-nova``
  * Setup OpenStack Nova
    * Nova-Controller
    * Nova-Compute
* ``pb-openstack-neutron``
  * Setup OpenStack Neutron
    * Neutron-Controller
    * Neutron-Network
    * Neutron-Compute
* ``pb-openstack-octavia``
  * Setup Octavia (No Support LBaaS)
    * Octavia-Controller
    * Octavia-Network
* ``pb-openstack-gnocchi``
  * Setup OpenStack Gnocchi (TDBaaS)
* ``pb-openstack-ceilometer``
  * Setup OpenStack Ceilometer
    * Ceilometer-Controller
    * Ceilometer-Compute
* ``pb-openstack-aodh``
  * Setup OpenStack Aodh
* ``pb-openstack-heat``
  * Setup OpenStack Heat
* ``pb-openstack-barbican``
  * Setup OpenStack Barbican
* ``pb-openstack-horizon``
  * Setup OpenStack Horizon
* ``pb-post-tasks``
  * Setup Post Tasks
    * Set Quota Default-Class and 'demo' project

## Dependencys Between Each Playbooks

(Note) When first time, One playbook must need all previous playbooks. but since 2nd time, you can run each playbook alone.

1. pb-etc-hosts
2. pb-common-env
3. pb-chrony-ntp
4. pb-galera-cluster
5. pb-pacemaker-cluster
6. pb-haproxy
7. pb-rabbitmq-cluster
8. pb-memcached
9. pb-zookeeper-cluster
10. pb-openstack-yum-repo
11. pb-openstack-keystone
12. pb-openstack-glance
13. pb-openstack-cinder
14. pb-openstack-nova
15. pb-openstack-neutron
16. pb-openstack-octavia
17. pb-openstack-gnocchi
18. pb-openstack-ceilometer
19. pb-openstack-aodh
20. pb-openstack-heat
21. pb-openstack-barbican
22. pb-openstack-horizon
23. pb-post-tasks

# Tutorial

## Configure Env.

### Inventory

#### inventory.lst

Edit This is Ansible Inventory File.
Role-Based Matching (OpenStack Components to Physical Server Group)


### Common Global-Variables

#### vars-globals.yml

This is variables yaml format file shared by all playbooks. 
Apply your cluster info to this files.

#### vars-etc-hosts.yml

Apply your cluster info to this files.

#### Playbook's Local-Variables

#### vars-{\*}.yml

There is some ``vars-*`` In each playbooks directory.
Apply your cluster info to this files.

## Run

### Run - Batch (All)

to run batch for all playbook automatically, use ``run-all-playbooks.sh``.

#### Example

```bash
[root@ansible-server ansible-openstack]# ./run-all-playbooks.sh 

All playbooks will be run, Are you sure (y/n)? y


Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.kakao.com
 * centos-qemu-ev: mirror.kakao.com
 * extras: mirror.kakao.com
 * updates: mirror.kakao.com
base                                                                                                                                                                                                                 | 3.6 kB  00:00:00     
centos-ceph-luminous                                                                                                                                                                                                 | 2.9 kB  00:00:00     
centos-qemu-ev                                                                                                                                                                                                       | 2.9 kB  00:00:00     
extras                                                                                                                                                                                                               | 3.4 kB  00:00:00     
updates                                                                                                                                                                                                              | 3.4 kB  00:00:00     
Package ansible-2.4.2.0-2.el7.noarch already installed and latest version
Nothing to do
=================== [Start] Playbook - 'pb-etc-hosts' ======================

PLAY [all] *********************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************************************************************************************************
ok: [ansible-controller-2]
ok: [ansible-compute-2]
ok: [ansible-compute-1]
ok: [ansible-controller-3]
ok: [ansible-controller-1]
ok: [ansible-network-1]
ok: [ansible-network-2]
.
.
.
(ing........)
```

### Run - Each Playbook

Each Playbook have ``run.sh``

#### Example

```bash
[root@ansible-server pb-openstack-keystone]# ./run.sh 

PLAY [openstack-controller] ****************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************************************************************************************************
ok: [ansible-controller-2]
ok: [ansible-controller-3]
ok: [ansible-controller-1]

TASK [openstack-keystone : Create MySQL Database - keystone] *******************************************************************************************************************************************************************************
ok: [ansible-controller-1]
.
.
.
(ing........)
```

# Access to UI

## OpenStack Horizon UI

http://{haproxy-vip}/dashboard

## RabbitMQ Management UI

http://{haproxy-vip}:15672

## HAProxy Stats

http://{haproxy-vip}:9000/haproxy_stats

## Add New Network Node

```bash
# vi inventory.lst

# vi vars-etc-hosts.yml

# ./add-network-node.sh
```

## Add New Compute Node

```bash
# vi inventory.lst

# vi vars-etc-hosts.yml

# ./add-compute-node.sh
```

# Appendix

## Included External Roles

### Role for DNS Nameservers

* [https://github.com/ahuffman/ansible-resolv](https://github.com/ahuffman/ansible-resolv)
* roles
  * dns-resolve

### Role for /etc/hosts

* [https://github.com/bertvv/ansible-role-hosts](https://github.com/bertvv/ansible-role-hosts)
* roles
  * etc-hosts

### Role for Galera Cluster

* [https://github.com/adfinis-sygroup/mariadb-ansible-galera-cluster](https://github.com/adfinis-sygroup/mariadb-ansible-galera-cluster)
* roles
  * galera_bootstrap
  * galera_conf
  * galera_packages
  * galera_privs
  * galera_repos

### Role for Zookeeper Cluster

* [https://github.com/sleighzy/ansible-zookeeper](https://github.com/sleighzy/ansible-zookeeper)
* roles
  * zookeeper-cluster

### Role for HAProxy

* [https://github.com/sha2017/server.loadbalancer](https://github.com/sha2017/server.loadbalancer)
* roles
  * haproxy
