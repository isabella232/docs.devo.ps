---
configuration:
  bind_host:
    default: 127.0.0.1
    description: The IP address to bind to.
    required: false
    type: string
  group:
    default: elasticsearch
    description: Running group for the elasticsearch process
    required: false
    type: string
  heap_size:
    default: 256m
    description: Heap size for the elasticsearch process (unit as 256m 1g)
    required: false
    type: string
  http_port:
    default: 9200
    description: Listening port for HTTP traffic
    maximum: 65536
    minimum: 1025
    required: false
    type: integer
  plugins:
    default: []
    description: List of extra plugins to install
    required: false
    type: array
  transport_port:
    default: 9300
    description: Listening port for inter-node traffic (cluster)
    maximum: 65536
    minimum: 1025
    required: false
    type: integer
  user:
    default: elasticsearch
    description: Running user for the elasticsearch process
    required: false
    type: string
documentation: http://www.elasticsearch.org/guide/
tags:
- database
- full text
title: ElasticSearch

---

## Example

    services:
      elasticsearch: '*'
    configuration:
      elasticsearch:
          bind_host: 0.0.0.0
          http_port: 9200
          heap_size: 4g

Install ElasticSearch on the node, make it listen on all interfaces (0.0.0.0), use the TCP/9200 port for the HTTP access and give the service a maximum of 4GB of RAM to operate.

Note that if your node does not have enough RAM the service will eventually crash.
## Tasks
### restart
# Task Restart

Restart ElasticSearch

### reload
# Task Reload

### start
# Task Start

Start ElasticSearch

### stop
# Task Stop

Stop ElasticSearch
