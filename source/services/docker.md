---
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
