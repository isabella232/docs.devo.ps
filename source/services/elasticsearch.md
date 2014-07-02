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
tasks:
- description: Restart ElasticSearch
  name: restart
  options: {}
- description: Reload ElasticSearch
  name: reload
  options: {}
- description: Start ElasticSearch
  name: start
  options: {}
- description: Stop ElasticSearch
  name: stop
  options: {}
title: ElasticSearch

---

## Tasks
### restart

#### Example in a devops task

    steps:
      - run: devops elasticsearch restart

### reload

#### Example in a devops task

    steps:
      - run: devops elasticsearch reload

### start

#### Example in a devops task

    steps:
      - run: devops elasticsearch start

### stop

#### Example in a devops task

    steps:
      - run: devops elasticsearch stop
