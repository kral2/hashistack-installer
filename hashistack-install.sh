#!/usr/bin/env bash

# HASHISTACK INSTALLER - Automated Installation of the HashiCorp Stack
#
#  Automatically Download, Extract and Install Latest or Specific
#  Version of Terraform, Packer, Consul, Vault, Nomad
#
# Inspired from https://github.com/robertpeteuil/packer-installer
# and https://github.com/robertpeteuil/terraform-installer

set -e

script_name=$(basename "$0")
version="0.2.0"

usage() {
  echo -e "usage: ${script_name} [packer|terraform|consul|vault|nomad]"
  echo -e "     you can provide multiple product names, separated by a space character"
  echo -e "     automatically use sudo to install to /usr/local/bin"
  echo -e ""
  echo -e "     -v\t\t: display ${script_name} version"
  echo -e "     -h\t\t: display usage instruction"
}

install_product() {
    echo "$script_name - version $version"
    echo "Automated Installation of the HashiCorp Stack tooling"
    echo ""
    for ((i=1; i<=$#; i++))
        do
            if [[ ${!i} =~ ^(packer|terraform|consul|vault|nomad)$ ]];then
                printf "Downloading %s installer ... \n" "${!i}"
                curl -LO "https://raw.github.com/kral2/hashistack-installer/main/${!i}-install.sh" 2>/dev/null
                chmod +x "${!i}-install.sh"
                ./"${!i}-install.sh" -a
                rm -f "${!i}-install.sh"
            else
                printf "%s is not a supported argument. Valid values are: packer, terraform, consul, vault, nomad\n" "${!i}"
            fi
        done
}

if [ -z "$1" ];then
    printf "No argument provided.\n"
    usage
    printf "\n"
elif [ "$1" == "-v" ];then
    printf "%s\n" "$version"
elif [ "$1" == "-h" ];then
    usage
else
    install_product "$@"
fi
