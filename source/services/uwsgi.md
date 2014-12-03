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
    listen:
      description: Listening HTTP address (either of "ip.ad.dr.es:port", or "port")
        - if not specified uses unix socket instead.
      required: false
      type: string
    module:
      description: The uWSGI module to execute in the app (e.g. django.core.handlers.wsgi:WSGIHandler(),
        wsgihandler:application)
      required: false
      type: string
    name:
      description: Name of the app
      required: true
      type: string
    root:
      description: root folder of the application
      required: true
      type: string
    virtualenv:
      description: Name of the virtualenv to use.
      required: false
      type: string
title: uWSGI

---
