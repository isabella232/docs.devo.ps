---
documentation: http://docs.couchbase.com/
experimental: true
tags:
- database
- nosql
tasks:
- description: Start CouchBase if stopped
  name: start
- description: Stop CouchBase if started
  name: stop
- description: Reload CouchBase, reload the configuration and perform a graceful restart
  name: reload
- description: Restart CouchBase, reload the configuration (but kills existing connection)
  name: restart
title: CouchBase

---
### Notes

For better user experience you may prefer the use of the `reload` task instead of `restart`.
