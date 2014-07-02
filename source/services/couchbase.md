---
configuration: {}
documentation: http://docs.couchbase.com/
tags:
- database
- nosql
tasks:
- description: Restart CouchBase
  name: restart
  options: {}
- description: Reload CouchBase
  name: reload
  options: {}
- description: Start CouchBase
  name: start
  options: {}
- description: Stop CouchBase
  name: stop
  options: {}
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
