---
configuration:
  admin_listen_address:
    default: 127.0.0.1
    description: Telnet admin interface listen address, usually only bind localhost
      IP address for the admin interface.
    required: false
    type: string
  admin_listen_port:
    default: 6082
    description: Telnet admin interface listen port.
    maximum: 65536
    minimum: 1
    required: false
    type: integer
  listen_address:
    default: ''
    description: Blank address means all IPv4 and IPv6 interfaces, otherwise specify
      a host name, an IPv4 dotted quad.
    required: false
    type: string
  listen_port:
    default: 6081
    description: Listen port.
    maximum: 65536
    minimum: 1
    required: false
    type: integer
  max_threads:
    default: 1000
    description: The maximum number of worker threads to start.
    minimum: 1
    required: false
    type: integer
  min_threads:
    default: '1'
    description: The minimum number of worker threads to start.
    minimum: 1
    required: false
    type: integer
  secret_file:
    default: /etc/varnish/secret
    description: File containing administration secret.
    required: false
    type: string
  storage_file:
    default: /var/lib/varnish/$INSTANCE/varnish_storage.bin
    description: Storage file, only used if storage_type is file.
    required: false
    type: string
  storage_size:
    default: 256M
    description: 'Cache size: in bytes, optionally using k / M / G / T suffix.'
    regex: /^\d+[kMGT]$/
    required: false
    type: string
  storage_type:
    default: malloc
    description: Store objects either in memory (malloc), on in a file (file).
    enum:
    - malloc
    - file
    required: false
    type: string
  thread_timeout:
    default: 120
    description: Idle timeout for worker threads.
    minimum: 1
    required: false
    type: integer
  ttl:
    default: 120
    description: Default TTL used when the backend does not specify one.
    minimum: 1
    required: false
    type: integer
  vcl_conf:
    default: /etc/varnish/default.vcl
    description: Main configuration file.
    required: false
    type: string
documentation: https://www.varnish-cache.org/docs
tags:
- caching
- reverse proxy
tasks:
- description: Restart Varnish
  name: restart
  options: {}
- description: Reload Varnish
  name: reload
  options: {}
- description: Start Varnish
  name: start
  options: {}
- description: Stop Varnish
  name: stop
  options: {}
title: Varnish

---

## Tasks
### restart

#### Example in a devops task

    steps:
      - run: devops varnish restart


### reload

#### Example in a devops task

    steps:
      - run: devops varnish reload


### start

#### Example in a devops task

    steps:
      - run: devops varnish start


### stop

#### Example in a devops task

    steps:
      - run: devops varnish stop

