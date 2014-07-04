---
configuration:
  bindip:
    default: 127.0.0.1
    description: Binding IP address.
    required: false
    type: string
  dbpath:
    default: /var/lib/mongodb
    description: Database files path.
    required: false
    type: string
  enable:
    default: 'yes'
    description: Enable or disable mongodb service.
    enum:
    - 'yes'
    - 'no'
    required: false
    type: string
  enable_rest:
    default: false
    description: Enable REST over the HTTP interface
    required: false
    type: boolean
  logpath:
    default: /var/log/mongodb/mongodb.log
    description: Database log file path.
    required: false
    type: string
  nohttp:
    default: 'false'
    description: Disable entirely the HTTP interface.
    enum:
    - 'true'
    - 'false'
    required: false
    type: string
  port:
    default: 27017
    description: Connection port.
    maximum: 65536
    minimum: 1025
    required: false
    type: integer
  user:
    default: mongodb
    description: Mongodb running user.
    required: false
    type: string
documentation: http://docs.mongodb.org/manual/
tags:
- database
- nosql
tasks:
- description: Start MongoDB if stopped
  name: start
- description: Stop MongoDB if started
  name: stop
- description: Reload MongoDB, reload the configuration and perform a graceful restart
  name: reload
- description: Restart MongoDB, reload the configuration (but kills existing connection)
  name: restart
title: MongoDB

---
