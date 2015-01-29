---
configuration:
  dns:
    default: []
    description: Array of DNS ips to pass to Docker and each container.
    required: false
    type: array
  extra_args:
    default: ''
    description: Extra arguments to pass to the Docker service. E.g. "--insecure-registry
      x.y.z:5000".
    required: false
    type: string
  inet:
    default: false
    description: Enable INET tcp for Docker service.
    required: false
    type: boolean
  inet_ip:
    default: 0.0.0.0
    description: IP address used to bind the Docker service.
    required: false
    type: string
  inet_port:
    default: 2375
    description: PORT address used to bind the Docker service.
    required: false
    type: string
  registry_mirror:
    default: ''
    description: Define the URL of the registry mirror to use.
    required: false
    type: string
  sock:
    default: true
    description: Enable UNIX socket for Docker service.
    required: false
    type: boolean
dependencies:
- supervisord
documentation: https://docs.docker.com/
experimental: true
tags:
- infrastructure
tasks:
- description: Start Docker if stopped
  name: start
- description: Stop Docker if started
  name: stop
- description: Reload Docker, reload the configuration.
  name: reload
- description: Restart Docker, stop then start the Docker daemon
  name: restart
- description: Pull a container image
  name: image pull
  options:
    name:
      description: Name of the docker image to pull
      required: true
      type: string
title: Docker

---
