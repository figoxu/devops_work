#!/usr/bin/env bash

ansible-playbook  -i ./hosts ./install.yml -l server \
--key-file ./.vagrant/machines/default/virtualbox/private_key

