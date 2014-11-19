---
backup: true
configuration:
  bindip:
    default: 127.0.0.1
    description: Binding IP address.
    required: false
    type: string
  databases:
    default: []
    description: Array of databases, defines a database and the list of users with
      only read-write access
    object_id: database
    options:
      name:
        default: null
        description: Database name
        required: true
        type: string
      users:
        default: []
        description: Array of users with read-write privileges on the database. If
          the user does not exist it will be created. Do not specify users that are
          already admin of the database or they will loose their admin privileges.
        required: false
        type: array
    required: false
    type: array
  dbpath:
    default: /var/lib/mongodb
    description: Database files path.
    required: false
    type: string
  enable:
    default: 'yes'
    description: Enable or disable mongodb service.
    enum:
    - 'yes'
    - 'no'
    required: false
    type: string
  enable_rest:
    default: false
    description: Enable REST over the HTTP interface
    required: false
    type: boolean
  logpath:
    default: /var/log/mongodb/mongodb.log
    description: Database log file path.
    required: false
    type: string
  nohttp:
    default: 'false'
    description: Disable entirely the HTTP interface.
    enum:
    - 'true'
    - 'false'
    required: false
    type: string
  port:
    default: 27017
    description: Connection port.
    maximum: 65536
    minimum: 1025
    required: false
    type: integer
  user:
    default: mongodb
    description: Mongodb running user.
    required: false
    type: string
  users:
    default: []
    description: Array of MongoDB admin db users. Passwords are randomly generated.
      A global admin user (named admin) is created automatically. The users defined
      here will be admin users of their respective databases
    object_id: user
    options:
      databases:
        default: []
        description: Array of database names where the user will be an admin
        required: false
        type: array
      name:
        default: null
        description: User name
        required: true
        type: string
    required: false
    type: array
documentation: http://docs.mongodb.org/manual/
tags:
- database
- nosql
tasks:
- description: Start MongoDB if stopped
  name: start
- description: Stop MongoDB if started
  name: stop
- description: Reload MongoDB, reload the configuration and perform a graceful restart
  name: reload
- description: Restart MongoDB, reload the configuration (but kills existing connection)
  name: restart
- description: Adds a MongoDB database admin user.
  name: user add
  options:
    databases:
      default: []
      description: Array of database names the user will become an admin of
      required: true
      type: array
    name:
      default: null
      description: User name
      required: true
      type: string
- description: Adds a database and the read-write users
  name: database add
  options:
    name:
      default: null
      description: Database name
      required: true
      type: string
    users:
      default: []
      description: Array of users with read-write privileges on the database.
      required: false
      type: array
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
title: MongoDB

---
