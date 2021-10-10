#!/usr/bin/env bash

set -e

# HASHISTACK INSTALLER - Automated Installation of the HashiCorp Stack
#
#  Automatically Download, Extract and Install Latest or Specific
#  Version of Terraform, Packer, Consul, Vault, Nomad
#
# Inspired from https://github.com/robertpeteuil/packer-installer
# and https://github.com/robertpeteuil/terraform-installer

./packer-install.sh -a
./terraform-install.sh -a
./consul-install.sh -a
./vault-install.sh -a
./nomad-install.sh -a