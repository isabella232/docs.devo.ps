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
  host:
    description: Set both 'bind_host' and 'publish_host'. If defined it overrides
      both 'bind_host' and 'publish_host' settings.
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
  publish_host:
    default: 127.0.0.1
    description: The address other nodes will use to communicate with this node.
    required: false
    type: string
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
tasks:
- description: Start ElasticSearch if stopped
  name: start
- description: Stop ElasticSearch if started
  name: stop
- description: Reload ElasticSearch, reload the configuration and perform a graceful
    restart
  name: reload
- description: Restart ElasticSearch, reload the configuration (but kills existing
    connection)
  name: restart
title: ElasticSearch

---
