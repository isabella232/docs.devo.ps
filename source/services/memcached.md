---
configuration:
  connection:
    default: 1024
    description: Maximumum number of concurrent inbound connections.
    required: false
    type: integer
  enable:
    default: 'yes'
    description: Enable or disable memcached service.
    enum:
    - 'yes'
    - 'no'
    required: false
    type: string
  listen:
    default: 127.0.0.1
    description: Binding IP address.
    required: false
    type: string
  logfile:
    default: /var/log/memcached.log
    description: Log file path
    required: false
    type: string
  memory:
    default: 64
    description: Amount of memory allocated in MB.
    minimum: 0
    required: false
    type: integer
  port:
    default: 11211
    description: Connection port.
    maximum: 65536
    minimum: 1025
    required: false
    type: integer
  user:
    default: memcache
    description: Memcached running user.
    required: false
    type: string
documentation: https://code.google.com/p/memcached/wiki/NewStart
tags:
- database
- caching
tasks:
- description: Start Memcached if stopped
  name: start
- description: Stop Memcached if started
  name: stop
- description: Reload Memcached, reload the configuration and perform a graceful restart
  name: reload
- description: Restart Memcached, reload the configuration (but kills existing connection)
  name: restart
title: Memcached

---
