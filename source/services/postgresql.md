---
configuration:
  authentication_timeout:
    default: 1min
    description: Timeout for the authentication, from 1s to 10min. Refer to the time
      units for more details.
    required: false
    type: string
  data_directory:
    default: /var/lib/postgresql/9.3/main
    description: Data folder.
    required: false
    type: string
  databases:
    default: []
    description: Array of databases, defines a database and the permissions of the
      users
    object_id: database
    options:
      name:
        default: null
        description: Database name
        required: true
        type: string
      users:
        default: []
        description: Array of users with full privileges on the database, users will
          be granted access from all their hosts
        required: false
        type: array
    required: false
    type: array
  effective_cache_size:
    default: 128MB
    description: Amount of memory expected to be available on the OS for data caching.
      Set up to 50% of the RAM on the server.
    required: false
    type: string
  external_pid_file:
    default: /var/run/postgresql/9.3-main.pid
    description: Path to the pid file.
    required: false
    type: string
  fsync:
    default: true
    description: Enable fsync of transaction to disk before being commited. Can reduce
      performance but is safer. Disable with caution.
    required: false
    type: boolean
  hba_file:
    default: /etc/postgresql/9.3/main/pg_hba.conf
    description: Path to the host-based authentication file.
    required: false
    type: string
  ident_file:
    default: /etc/postgresql/9.3/main/pg_ident.conf
    description: Path to the ident configuration file.
    required: false
    type: string
  listen_addresses:
    default: localhost
    description: Comma-separated list of addresses, use * for all.
    required: false
    type: string
  max_connections:
    default: 100
    description: Maximum amount of concurrent connection to PostgreSQL, note that
      increasing the max_connections costs ~400 bytes of shared memory per connection
      slot, plus lock space (see max_locks_per_transaction).
    minimum: 1
    required: false
    type: integer
  pg_ctl_options:
    default: ''
    description: This configuration file contains cluster specific options to be passed
      to pg_ctl.
    required: false
    type: string
  port:
    default: 5432
    description: Listening port.
    maximum: 65536
    minimum: 1
    required: false
    type: integer
  shared_buffers:
    default: 128MB
    description: Amount of memory allocated to PostgreSQL to cache data. Set to up
      to 25% of the RAM available on the server.
    required: false
    type: string
  ssl:
    default: true
    description: Enable SSL.
    required: false
    type: boolean
  ssl_cert_file:
    default: /etc/ssl/certs/ssl-cert-snakeoil.pem
    description: SSL certificate.
    required: false
    type: string
  ssl_ciphers:
    default: DEFAULT:!LOW:!EXP:!MD5:@STRENGTH
    description: Allowed SSL ciphers.
    required: false
    type: string
  ssl_key_file:
    default: /etc/ssl/private/ssl-cert-snakeoil.key
    description: SSL private key.
    required: false
    type: string
  ssl_renegotiation_limit:
    default: 512MB
    description: Amount of data between SSL renegotiations. Refer to the size units
      for more details.
    required: false
    type: string
  superuser_reserved_connections:
    default: 3
    description: Number of connections reserved to the superuser.
    required: false
    type: integer
  unix_socket_directories:
    default: /var/run/postgresql
    description: Comma-separated list of directories used to store the unix sockets.
    required: false
    type: string
  users:
    default: []
    description: Array of MySQL users. Passwords are randomly generated.
    object_id: user
    options:
      name:
        default: null
        description: User name
        required: true
        type: string
    required: false
    type: array
documentation: http://www.postgresql.org/docs/
tags:
- database
- relational
tasks:
- description: Start PostgreSQL if stopped
  name: start
- description: Stop PostgreSQL if started
  name: stop
- description: Reload PostgreSQL, reload the configuration and perform a graceful
    restart
  name: reload
- description: Restart PostgreSQL, reload the configuration (but kills existing connection)
  name: restart
title: PostgreSQL

---
# Units in the configuration

The various size or time configuration items can be expressed in the following units.

## Memory units

  kB = kilobytes
  MB = megabytes
  GB = gigabytes

## Time units

  ms  = milliseconds
  s   = seconds
  min = minutes
  h   = hours
  d   = days