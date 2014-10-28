---
configuration:
  packages:
    default: []
    description: List of pip packages to install globally on the system
    required: false
    type: array
documentation: https://docs.python.org/2/
tags:
- language
tasks:
- description: Setup a python application
  name: app add
  options:
    requirements_file:
      description: Full path to the requirements.txt file
      required: true
      type: string
    virtualenv:
      description: Name of the virtualenv to use
      required: false
      type: string
title: Python

---
