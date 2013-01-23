Folsom-manifests
================

Install Ubuntu 12.04.1 LTS x86\_64 (preferred)

  apt-get update && apt-get upgrade && apt-get install git puppet ipmitool python-jinja2 python-passlib python-yaml

clone this repo to your build node

  git clone https://github.com/robertstarmer/folsom-manifests -b multi-node
  cp folsom-manifests/\* /etc/puppet/manifests

Clone the puppet modules

  cd /etc/puppet/manifests/
  /etc/puppet/manifests/puppet-modules.sh

Edit the yaml config:

  cp /etc/puppet/manifests/site.yaml{.example,}
  vi /etc/puppet/manifests/site.yaml

Run the site generator:

  /etc/puppet/manifests/create\_site.py

"Reset" your environment

  puppet apply -v /etc/puppet/manifests/site.pp
  puppet plugin download
  /etc/puppet/manifests/reset\_site.sh

Wait ~ 15 minutes, and then check out your new OpenStack cluster:

  http://{control\_node\_ip\_or\_dns}/


