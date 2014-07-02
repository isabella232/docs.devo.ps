---
configuration:
  gems:
    default: []
    description: List of gems to install globally on the system
    required: false
    type: array
documentation: https://www.ruby-lang.org/en/documentation/
tags:
- language
tasks:
- description: Remove Ruby gems if installed
  name: gems remove
  options:
    gems:
      description: List of gems to remove
      required: true
      type: array
- description: Add Ruby gems globally
  name: gems add
  options:
    gems:
      description: List of gems to install
      required: true
      type: array
title: Ruby

---

## Tasks
### gems remove

#### Example in a devops task

    steps:
      - run: devops ruby gems remove
        options:
          gems:
            - compass

### gems add

#### Example in a devops task

    steps:
      - run: devops ruby gems add
        options:
          gems:
            - compass
