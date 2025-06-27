![orches logo](https://raw.githubusercontent.com/orches-team/common/main/orches-logo-text.png)

# orches-cayo: Rootful orches Repository

This repository provides rootful podman configuration for [orches](https://github.com/orches-team/orches), a simple git-ops tool for orchestrating [Podman](https://podman.io/) containers and systemd units on a single machine. It is designed for users who want to run orches and managed containers with root privileges, leveraging systemd system services and Podman rootful containers.

## Contents

- [Overview](#overview)
- [Ports](#container-port-mappings)

## Overview

This repository contains sample unit files for running orches and a demo [Caddy](https://caddyserver.com/) webserver as rootful Podman containers. It is intended to be used as a starting point for your own orches deployments. You can fork this repository and add or modify unit files to manage your own containers and services.

## Container Port Mappings

| Container File     | Published Ports           |
| ------------------ | ------------------------- |
| caddy.container    | 80:80,443:443,443:443/udp |
| glance.container   | 8888:8080                 |
| jellyfin.container | 8096:8096                 |
| joplin.container   | 22300:22300               |
| joplindb.container | None                      |
| orches.container   | None                      |
