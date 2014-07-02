---
configuration: {}
documentation: http://www.x.org/wiki/
tags:
- app
tasks:
- description: Restart Xvfb
  name: restart
  options: {}
- description: Start Xvfb
  name: start
  options: {}
- description: Stop Xvfb
  name: stop
  options: {}
title: Xvfb

---

## Tasks
### restart

#### Example in a devops task

    steps:
      - run: devops xvfb restart


### start

#### Example in a devops task

    steps:
      - run: devops xvfb start


### stop

#### Example in a devops task

    steps:
      - run: devops xvfb stop

