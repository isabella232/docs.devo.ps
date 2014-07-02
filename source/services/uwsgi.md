---
configuration: {}
documentation: http://uwsgi-docs.readthedocs.org/en/latest/
tags:
- app
title: uWSGI

---

## Example

    services:
      uwsgi: '*'

Add support for uWSGI on the node, installing Python Emperor to manage the applications.

Note that the applications are managed via dedicated tasks.
## Tasks
### restart
# Task Restart

Restart emperor service

### add app
# Add uwsgi app

Define a uWsgi app to be ran via Emperor. It will create the Emperor configuration file based on the passed options' task and ensure it is running.

# Example in a task

    do:
      - run: devops uwsgi add_app
        options:
          name: my_app
          root: /opt/that_folder
          module: some_django_module
          port: 3000

### start
# Task Start

Start emperor service

### stop
# Task Stop

Stop emperor service
