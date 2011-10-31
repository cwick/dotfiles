#!/bin/bash
sudo puppet apply --verbose --modulepath=modules $@ manifests/provision.pp
