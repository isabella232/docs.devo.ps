---
configuration:
  path:
    default: /opt/backup/%Y/%m/%d
    description: Default path of the destination of the backup files
    required: false
    type: string
  schedules:
    default: []
    description: List of schedules at which the backup will run via cronjob. Crontab
      Format (ex. 0 */2 * * *)
    required: false
    type: array
experimental: true
tags:
- backup
tasks:
- description: Run the backup
  name: run
  options:
    couchdb_dbs:
      description: List of the CouchDB databases to backup (default to all dbs)
      required: false
      type: array
    files:
      description: List of all the files / folders to backup
      required: false
      type: array
    mongodb_dbs:
      description: List of the MongoDB databases to backup (default to all dbs)
      required: false
      type: array
    mysql_dbs:
      description: List of the MySQL databases to backup (default to all dbs)
      required: false
      type: array
    path:
      default: /opt/backup/%Y/%m/%d
      description: Full path of the storage destination. See [documentation](https://github.com/devo-ps/backupallthethings#custom-destination-folder)
      required: false
      type: string
    postgresql_dbs:
      description: List of the PostgreSQL databases to backup (default to all dbs)
      required: false
      type: array
    redis_dbs:
      description: List of the Redis databases to backup (default to all dbs)
      required: false
      type: array
    services:
      description: List of the services to backup
      required: false
      type: array
title: Backup

---
The backup service provides simple local backup for the services installed on the server. It relies on [BackupAllTheThings](https://pypi.python.com/pypi/backupallthethings). Consider this service only as a conveniency, not as a full-blown backup framework. 

## Backup support

Several of the databases available in [devo.ps](http://devo.ps) come with a *backup* support among which:

- MySQL 
- PostgreSQL
- CouchDB
- MongoDB
- Redis

The backup files are then available by default in /opt/backup/YYYY/MM/DD/{service} in compressed archives.

The services for which the backup service is available are marked in the documentation.

## Limitations

Currently the following features are **not supported**:

- remote storage
- encryption
- restore

You may want to rely on other backup frameworks to push the archives remotely and securely.

Restoring backup is still a manual task. You will have to perform it by yourself using the appropriate commands for each of the services.