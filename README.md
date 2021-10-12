# Installer for HashiCorp Stack - Automated Installation

## Automatically Download, Extract and Install Latest or Specific Version

[![release](https://img.shields.io/github/v/release/kral2/hashistack-installer?colorB=2067b8)](https://github.com/kral2/hashistack-installer)
[![bash](https://img.shields.io/badge/language-bash-89e051.svg?style=flat-square)](https://github.com/kral2/hashistack-installer)
[![license](https://img.shields.io/github/license/kral2/hashistack-installer?colorB=2067b8)](https://github.com/kral2/hashistack-installer)

---

The **hashistack-install** script automates the process of downloading and installing HashiCorp tools:

1. Packer
2. Terraform
3. Consul
4. Vault
5. Nomad
6. Boundary
7. Waypoint

It is based on [Robert Peteuil](https://github.com/robertpeteuil)'s excellent [terraform-installer](https://github.com/robertpeteuil/terraform-installer) and [packer-installer](https://github.com/robertpeteuil/packer-installer).

- additional install scripts for [Consul](https://www.consul.io/), [Vault](https://www.vaultproject.io/), [Nomad](https://www.nomadproject.io/), [Boundary](https://www.boundaryproject.io/) and [Waypoint](https://www.waypointproject.io/)were created.
- minor changes were also made to select binaries correctly for Linux on arm (use `arm64` binaries instead of `arm` when `aarch` is detected).

Current version is just a wrapper script calling each individual installer with the `-a` flag, which automatically `sudo` to install to `/usr/bin/local`.

It only support to install the latest available version on [release.hashicorp.com](https://releases.hashicorp.com/). Future versions of this global installer may give more choices, exposing installer options for each installer.

For detailed options and capabilities of each installer, please see Robert's [Packer Installer](https://github.com/robertpeteuil/packer-installer) and [Terraform Installer](https://github.com/robertpeteuil/terraform-installer).

If/when https://iac.sh evovles to support the installation of HashiCorp products other than Terraform and Packer, this project will be a good candidate for archives :-)

## Download and Use Locally

Download Installer

``` shell
curl -LO https://raw.github.com/kral2/hashistack-installer/main/hashistack-install.sh
chmod +x hashistack-install.sh
```

Run local installer, passing a product name as argument:

``` shell
./hashistack-install.sh [packer|terraform|consul|vault|nomad|boundary|waypoint]
```

You can install multiple products at once:

``` shell
./hashistack-install.sh packer terraform vault
```

## System Requirements

- System with Bash Shell (Linux, macOS, Windows Subsystem for Linux)
- `unzip` - terraform downloads are in zip format
- `curl` or `wget` - script will use either one to retrieve metadata and download

Optional

- `jq` - if installed, latest version parsed from hashicorp downloads
  - Useful if latest github release differs from version on hashicorp downloads
  - Avoids github api limit of 60 requests per hour (unauthenticated)
