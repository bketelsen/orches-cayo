![orches logo](https://raw.githubusercontent.com/orches-team/common/main/orches-logo-text.png)

# orches-config-rootful: Rootful orches Template Repository

This repository provides a rootful configuration template for [orches](https://github.com/orches-team/orches), a simple git-ops tool for orchestrating [Podman](https://podman.io/) containers and systemd units on a single machine. It is designed for users who want to run orches and managed containers with root privileges, leveraging systemd system services and Podman rootful containers.

## Contents

- [Overview](#overview)
- [Quick Start](#quick-start)
- [Repository Structure](#repository-structure)
- [Customizing Your Deployment](#customizing-your-deployment)

## Overview

This repository contains sample unit files for running orches and a demo [Caddy](https://caddyserver.com/) webserver as rootful Podman containers. It is intended to be used as a starting point for your own orches deployments. You can fork this repository and add or modify unit files to manage your own containers and services.

## Quick Start

### Prerequisites
- Podman >= 4.4
- systemd

Tested on Fedora 41, Ubuntu 24.04, and CentOS Stream 9/derivatives.

### 1. Create required directories
```bash
sudo mkdir -p /var/lib/orches /etc/containers/systemd
```

### 2. Initialize orches with this repository
```bash
sudo podman run --rm -it --pid=host --pull=newer \
  --mount \
    type=bind,source=/run/systemd,destination=/run/systemd \
  -v /var/lib/orches:/var/lib/orches \
  -v /etc/containers/systemd:/etc/containers/systemd  \
  ghcr.io/orches-team/orches init \
  https://github.com/orches-team/orches-config-rootful.git
```

### 3. Verify orches and caddy are running
```bash
systemctl status orches
systemctl status caddy
sudo podman exec systemd-orches orches status
curl localhost:8080
```

## Repository Structure

- `orches.container`: Unit file for running orches as a rootful Podman container
- `caddy.container`: Example unit file for running a Caddy webserver

You can add more `.container` or `.service` files to manage additional containers or systemd services.

## Customizing Your Deployment

To add a new application (e.g., [Jellyfin](https://jellyfin.org/)):
1. Fork this repository and clone it locally.
2. Add a new unit file, e.g. `jellyfin.service`:

```ini
[Container]
Image=docker.io/jellyfin/jellyfin
Volume=config:/config:Z
Volume=cache:/cache:Z
Volume=media:/media:Z
PublishPort=8096:8096

[Install]
WantedBy=multi-user.target default.target
```

3. Commit and push your changes.
4. Switch orches to your fork:
```bash
sudo podman exec systemd-orches orches switch <YOUR_FORK_URL>
```
