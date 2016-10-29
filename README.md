# New Relic Linux Infrastructure Agent

This repository contains a Dockerfile to build the New Relic Infrastructure Agent to be run in a Docker container (centos/systemd)

The container should be installed as a systemd managed process.

## Configuration

The following ENV variables are required:

- INSTALL_SCRIPT (optional)
- NEWRELIC_LICENSE_KEY

## Installation

```
[Unit]
Description=New Relic Infrastructure Agent (newrelic-infra)
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=10m
ExecStartPre=-/usr/bin/docker kill newrelic-infra
ExecStartPre=-/usr/bin/docker rm newrelic-infra
ExecStartPre=/usr/bin/docker pull ausnimbus/newrelic-infra:latest
ExecStart=/usr/bin/docker run --name newrelic-infra  \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /dev:/dev \
-v /sys:/sys \
--privileged=true \
--net=host \
-e NEWRELIC_LICENSE_KEY=xyz \
ausnimbus/newrelic-infra:latest
ExecStop=/usr/bin/docker stop -t 30 newrelic-infra

[Install]
WantedBy=multi-user.target
```

## Reference
https://docs.newrelic.com/docs/infrastructure/new-relic-infrastructure/installation/install-infrastructure-linux
