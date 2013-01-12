#!/bin/sh
# This script will get all puppet modules required
# for the deployment of the Cisco OpenStack Edition (COE)
echo "Getting Puppet Modules"
FILE_LIST=modules.list
RELEASE=folsom
REPO=https://github.com/CiscoSystems/
PUPPET_PATH=/etc/puppet/
PUPPET_MODULES=/etc/puppet/modules

while IFS= read -r module
do
        # display $line or do somthing with $line
	# echo "$module"
	git clone -b $RELEASE "$REPO"puppet-"$module".git "$PUPPET_MODULES"/$module
done <"$FILE_LIST"

# TODO: This module does not follow the naming "puppet-module" convention
git clone -b $RELEASE "$REPO"puppetlabs-lvm.git "$PUPPET_MODULES"/lvm

# current intereim step, adding these packages rather than including them in modules.list
git clone https://github.com/iawells/puppet-openstack -b folsom "$PUPPET_MODULES"/openstack
git clone https://github.com/iawells/openstack-quantum-puppet -b ian-refactor "$PUPPET_MODULES"/quantum
git clone https://github.com/iawells/puppet-vswitch-1 "$PUPPET_MODULES"/vswitch
git clone https://github.com/robertstarmer/puppet-sshroot "$PUPPET_MODULES"/sshroot
