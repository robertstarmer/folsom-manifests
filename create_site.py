#!/usr/bin/python
import yaml
from passlib.apps import custom_app_context as pwd_context
from jinja2 import Template, Environment, FileSystemLoader

test = yaml.load(open("/etc/puppet/manifests/site.yaml"))
site = open("/etc/pupet/manifests/site.pp","w")
env = Environment(loader=FileSystemLoader('/etc/puppet/manifests/'))
if test['default']['password']:
  test['default']['password'] = pwd_context.encrypt(test['default']['password'])
template = env.get_template('site.pp.template')

site.write(template.render(test))

