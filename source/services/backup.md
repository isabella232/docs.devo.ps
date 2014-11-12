---
tags:
- backup
tasks:
- description: Save a list of files and folders to a compressed tar archive
  name: file archive
  options:
    files:
      description: List of files to backup
      required: true
      type: array
    name:
      description: Name of the archive to create (suffixed by the timestamp)
      required: true
      type: string
title: Backup

---
README.md