![orches logo](https://raw.githubusercontent.com/orches-team/common/main/orches-logo-text.png)

# orches-cayo: Rootful podman definitions

This repository provides rootful podman configuration for [orches](https://github.com/orches-team/orches), a simple git-ops tool for orchestrating [Podman](https://podman.io/) containers and systemd units on a single machine. It is designed for users who want to run orches and managed containers with root privileges, leveraging systemd system services and Podman rootful containers.

## Contents

- [Overview](#overview)
- [Ports](#container-port-mappings)

## Overview

This repository contains sample unit files for running orches and a demo [Caddy](https://caddyserver.com/) webserver as rootful Podman containers. It is intended to be used as a starting point for your own orches deployments. You can fork this repository and add or modify unit files to manage your own containers and services.

## Storage

ZFS:

```sh
NAME   SIZE  MOUNT
fast  1.81T  /mnt/fast
slow  29.1T  /mnt/slow
```

Repo location:

```sh
/var/lib/orches/repo/
```

All paths in this repo are on disk relative to the above location.

## TODO

- [ ] Move caddy from previous host
- [ ] Wait for painful rsync
- [ ] PaperlessNGX

## Container Port Mappings

| Container File       | Published Ports            |
| -------------------- | -------------------------- |
| caddy.container      | 80:80,443:443,443:443/udp, |
| glance.container     | 8888:8080,                 |
| jellyfin.container   | 8096:8096,                 |
| jellyseerr.container | 5055:5055,                 |
| joplin.container     | 22300:22300,               |
| joplindb.container   | 5432:5432,                 |
| orches.container     | None                       |
| prowlarr.container   | 9696:9696,                 |
| radarr.container     | 7878:7878,                 |
| sabnzbd.container    | 8080:8080,                 |
| sonarr.container     | 8989:8989,                 |
