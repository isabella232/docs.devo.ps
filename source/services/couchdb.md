---
backup: true
configuration:
  admin_pass:
    default: admin
    description: Define the admin password
    required: false
    type: string
  admin_user:
    default: admin
    description: Define the admin username
    required: false
    type: string
  bind_address:
    default: 127.0.0.1
    description: The IP address to bind to.
    required: false
    type: string
  enable:
    default: '1'
    description: Define whether CouchDB should start at bood time
    required: false
    type: integer
  insecure:
    default: false
    description: Allow insecure setup (no admin user)
    required: true
    type: boolean
  max_document_size:
    default: 4294967296
    description: Maximum document size
    required: false
    type: integer
  port:
    default: 5984
    description: Listening port
    maximum: 65536
    minimum: 1025
    required: false
    type: integer
  running_user:
    default: couchdb
    description: Define the running user for the CouchDB process (it needs to exist)
    required: false
    type: string
  stderr_file:
    default: /dev/null
    description: Where to send the process STDERR
    required: false
    type: string
  stdout_file:
    default: /dev/null
    description: Where to send the process STDOUT
    required: false
    type: string
documentation: http://docs.couchdb.org/en/latest/
tags:
- database
- nosql
tasks:
- description: Start CouchDB if stopped
  name: start
- description: Stop CouchDB if started
  name: stop
- description: Reload CouchDB, reload the configuration and perform a graceful restart
  name: reload
- description: Restart CouchDB, reload the configuration (but kills existing connection)
  name: restart
- description: Backup database(s)
  name: database backup
  options:
    name:
      default: null
      description: Database name, if not defined it will backup all the databases
      required: false
      type: array
    path:
      default: /opt/backup/%Y/%m/%d
      description: Path to destination folder of the backup
      required: false
      type: string
title: CouchDB

---
### Notes

For better user experience you may prefer the use of the `reload` task instead of `restart`.
