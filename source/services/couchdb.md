---
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
title: CouchDB

---

## Example

    services:
      couchdb: '*'
    configuration:
      couchdb:
        bind_address: 0.0.0.0

Install CouchDB on the node and make the service listen on all interfaces (0.0.0.0)
## Tasks
### restart
# Restart

Do a full restart of the CouchDB service, effectively stopping and re-starting the service.

For better user experience you may prefer the use of the `reload` task instead.

# Example in a devops task

    do:
      - run: devops couchdb restart

### reload
# Reload

Do a graceful restart of the CouchDB service, reloading the configuration.

# Example in a devops task

    do:
      - run: devops couchdb reload

### start
# Start

Start the CouchDB service, it does not do anything if it is already running.

# Example in a devops task

    do:
      - run: devops couchdb start

### stop
# Stop

Stop the CouchDB service, it does not do anything if it is already stopped.

# Example in a devops task

    do:
      - run: devops couchdb stop
