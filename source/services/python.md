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
- description: Install python packages
  name: packages add
  options:
    packages:
      description: List of packages to install
      required: false
      type: array
    requirements_file:
      description: Full path to the requirements.txt file
      required: false
      type: string
    virtualenv:
      description: Name of the virtualenv to use
      required: false
      type: string
- description: Remove python packages
  name: packages remove
  options:
    packages:
      description: List of packages to remove
      required: false
      type: array
    requirements_file:
      description: Full path to the requirements.txt file
      required: false
      type: string
    virtualenv:
      description: Name of the virtualenv to consider
      required: false
      type: string
title: Python

---
Standard Python language support is part of standard ubuntu distribution. We also install pip without the need to explicitly define python service in your node configuration.

You can use this service configuration to install pip packages globally by adding them to the packages array. If you want to host python web applications take a look at our [uWSGI documentation](http://docs.devo.ps/services/uwsgi/).
 