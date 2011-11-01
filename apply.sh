#!/bin/bash
sudo apt-get install puppet -yq > /dev/null
sudo puppet apply --verbose --modulepath=modules $@ manifests/provision.pp
