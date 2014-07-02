---
configuration: {}
documentation: http://uwsgi-docs.readthedocs.org/en/latest/
tags:
- app
tasks:
- description: Restart uWSGI emperor
  name: restart
  options: {}
- description: Restart uWSGI emperor
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
- description: Start uWSGI emperor
  name: start
  options: {}
- description: Stop uWSGI emperor
  name: stop
  options: {}
title: uWSGI

---

## Tasks
### restart

#### Example in a devops task

    steps:
      - run: devops uwsgi restart


### app add

#### Example in a task

    steps:
      - run: devops uwsgi app add
        options:
          name: my_app
          root: /opt/that_folder
          module: some_django_module
          port: 3000

### start

#### Example in a devops task

    steps:
      - run: devops uwsgi start


### stop

#### Example in a devops task

    steps:
      - run: devops uwsgi stop

