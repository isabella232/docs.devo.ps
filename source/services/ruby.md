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
- description: Add Ruby gems globally
  name: gems add
  options:
    gems:
      description: List of gems (string) to add
      required: true
      type: array
- description: Remove Ruby gems globally
  name: gems remove
  options:
    gems:
      description: List of gems (string) to remove
      required: true
      type: array
title: Ruby

---
