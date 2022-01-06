#!/usr/bin/env bash

# HASHISTACK INSTALLER - Automated Installation of the HashiCorp Stack
#
#  Automatically Download, Extract and Install Latest or Specific
#  Version of Terraform, Packer, Consul, Vault, Nomad, Boundary, Waypoint
#
# Largely inspired from https://github.com/robertpeteuil/packer-installer
# and https://github.com/robertpeteuil/terraform-installer
#
# If/when https://iac.sh evovles to support the installation of HashiCorp products other than Terraform and Packer,
# this project will be a good candidate for archives :-)

set -e

script_name=$(basename "$0")
version="0.3.3"

usage() {
  echo -e "usage: ${script_name} [ packer | terraform | consul | vault | nomad | boundary | waypoint ]"
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
            if [[ ${!i} =~ ^(packer|terraform|consul|vault|nomad|boundary|waypoint)$ ]];then
                printf "Downloading %s installer ... \n" "${!i}"
                curl -LO "https://raw.github.com/kral2/hashistack-installer/main/${!i}-install.sh" 2>/dev/null
                chmod +x "${!i}-install.sh"
                ./"${!i}-install.sh" -c
                rm -f "${!i}-install.sh"
            else
                printf "%s is not a supported argument. Valid values are: packer, terraform, consul, vault, nomad, boundary, waypoint\n" "${!i}"
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
