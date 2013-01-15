#!/usr/bin/python
import yaml
from passlib.apps import custom_app_context as pwd_context
from jinja2 import Template, Environment, FileSystemLoader

test = yaml.load(open("site.yaml"))
site = open("site.pp","w")
env = Environment(loader=FileSystemLoader('./'))
if test['default']['password']:
  test['default']['password'] = pwd_context.encrypt(test['default']['password'])
template = env.get_template('site.pp.template')

site.write(template.render(test))

