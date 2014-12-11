---
configuration:
  packages:
    default: []
    description: List of packages to have globally installed on the server
    required: false
    type: array
documentation: http://nodejs.org/api/
name: nodejs
tags:
- language
tasks:
- description: Start all the apps managed by Foreverd (node.js) if stopped
  name: start
- description: Stop all the apps managed by Foreverd (node.js) if started
  name: stop
- description: Restart all the apps managed by Foreverd (node.js).
  name: restart
- description: Add a new app defintion for foreverd to run
  name: app add
  options:
    extra_env:
      description: additional environment variable to pass to the application
      required: false
      type: string
    name:
      description: name of your app
      required: true
      type: string
    node_env:
      description: node.js environment var NODE_ENV
      required: false
      type: string
    root:
      description: path of the root folder of your app
      required: true
      type: string
    script:
      description: node.js script to run via foreverd
      required: true
      type: string
    user:
      default: devops
      description: running user of the application
      required: false
      type: string
title: Node.js

---
