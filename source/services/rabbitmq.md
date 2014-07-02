---
configuration: {}
documentation: https://www.rabbitmq.com/documentation.html
tags:
- messagebus
tasks:
- description: Restart RabbitMQ
  name: restart
  options: {}
- description: Reload RabbitMQ
  name: reload
  options: {}
- description: Start RabbitMQ
  name: start
  options: {}
- description: Stop RabbitMQ
  name: stop
  options: {}
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

