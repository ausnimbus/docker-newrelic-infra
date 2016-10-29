# New Relic Linux Infrastructure Agent

This repository contains a Dockerfile to build the New Relic Infrastructure Agent to be run in a Docker container (centos/systemd)

The container should be installed as a systemd managed process.

## Configuration

The following ENV variables are required:

- INSTALL_SCRIPT
- NEWRELIC_LICENSE_KEY

## Reference
https://docs.newrelic.com/docs/infrastructure/new-relic-infrastructure/installation/install-infrastructure-linux
