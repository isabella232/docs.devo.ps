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
title: Node.js

---

## Example

    services:
      nodejs: '*'
    configuration:
      nodejs: 
        packages:
          - forever
          - bower
          - grunt-cli

Install Node.js on the node, and install globally `forever`, `bower` and `grunt-cli` (as in `npm install -g xxx`).
## Tasks
### restart
# Task Restart

Restart node.js forever service

### add app
# Task Add_app

### start
# Task Start

Start node.js forever service

### stop
# Task Stop

Stop node.js forever service
