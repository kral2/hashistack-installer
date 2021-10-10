# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and the versioning follows the [Semantic Versioning 2.0.0](https://semver.org/) specification.

Given a version number MAJOR.MINOR.PATCH:

- MAJOR version when making incompatible API changes,
- MINOR version when adding functionality in a backwards compatible manner,
- PATCH version when making backwards compatible bug fixes.

## [0.2.0] - 2021-10-10

### Added

- option to choose individual product to install

### Changed

- individual installers are pulled from the Git repo at execution time

## [0.1.0] - 2021-10-10

First release.

- wrapper script calling each individual installer with the `-a` flag
- install Packer, Terraform, Consul, Vault, Nomad
