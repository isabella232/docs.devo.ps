---
configuration:
  packages:
    default: []
    description: List of packages to have globally installed on the server
    required: false
    type: array
documentation: http://nodejs.org/api/
tags:
- language
tasks:
- description: Restart node.js foreverd
  name: restart
  options: {}
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
- description: Start node.js foreverd
  name: start
  options: {}
- description: Stop node.js foreverd
  name: stop
  options: {}
title: Node.js

---

## Tasks
### restart

#### Example in a devops task

    steps:
      - run: devops nodejs restart


### app add

#### Example in a devops task

    steps:
      - run: devops nodejs app add
        options:
          name: myapp
          root: /var/www/myapp 
          script: app.js 
          node_env: production 
          user: nobody 
          extra_env: "NODE_DEBUG=DEBUG SOME_ENV=OTHER"


### start

#### Example in a devops task

    steps:
      - run: devops nodejs start


### stop

#### Example in a devops task

    steps:
      - run: devops nodejs stop

