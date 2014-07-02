---
configuration: {}
documentation: http://docs.couchbase.com/
tags:
- database
- nosql
tasks:
- description: Restart CouchBase
  name: restart
  options: null
- description: Reload CouchBase
  name: reload
  options: null
- description: Start CouchBase
  name: start
  options: null
- description: Stop CouchBase
  name: stop
  options: null
title: CouchBase

---

## Tasks
### restart

For better user experience you may prefer the use of the `reload` task instead.

#### Example in a devops task

    steps:
      - run: devops couchbase restart

### reload

#### Example in a devops task

    steps:
      - run: devops couchbase reload

### start

#### Example in a devops task

    steps:
      - run: devops couchbase start

### stop

#### Example in a devops task

    steps:
      - run: devops couchbase stop
