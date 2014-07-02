---
configuration: {}
documentation: https://www.rabbitmq.com/documentation.html
tags:
- messagebus
tasks:
- description: Restart RabbitMQ
  name: restart
  options: null
- description: Reload RabbitMQ
  name: reload
  options: null
- description: Start RabbitMQ
  name: start
  options: null
- description: Stop RabbitMQ
  name: stop
  options: null
title: RabbitMQ

---

## Tasks
### restart

#### Example in a devops task

    steps:
      - run: devops rabbitmq restart


### reload

#### Example in a devops task

    steps:
      - run: devops rabbitmq reload


### start

#### Example in a devops task

    steps:
      - run: devops rabbitmq start


### stop

#### Example in a devops task

    steps:
      - run: devops rabbitmq stop

