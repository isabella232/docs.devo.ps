---
documentation: http://uwsgi-docs.readthedocs.org/en/latest/
experimental: true
tags:
- app
tasks:
- description: Start uWSGI emperor if stopped
  name: start
- description: Stop uWSGI emperor if started
  name: stop
- description: Restart uWSGI emperor, reload the configuration (but kills existing
    connection)
  name: restart
- description: Add a new uWSGI application configuration
  name: app add
  options:
    module:
      description: stuff
      required: false
      type: string
    name:
      description: Name of the app
      required: true
      type: string
    port:
      description: listening TCP port
      required: true
      type: int
    root:
      description: root folder of the application
      required: true
      type: string
title: uWSGI

---
