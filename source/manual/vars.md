---
title: Variables
---

## Types of variables

Variables, usually refered to as `vars`, are various kind of values available through devo.ps;

- **Services configuration**; each service comes with a set of default configuration that you can override. The value of each each of these configuration is available as a variable.

    For example, the NGINX service has a `events.worker_connections` [configuration variable](/services/nginx#configuration). If that service is installed on the `web_1` node, then you should be able to access it at `{{ web_1.configuration.nginx.events.worker_connections }}`.

- **Meta data**; some information coming is dynamically assigned to each node upon provisioning.

    For example, the IP address (`{{ web_1.ip }})`) or devops SSH key (`{{ web1.pub_key }}`).

- **Custom variables**; users can define custom variables in the `vars` attributes of nodes, tasks and tasks commands.

    For example, 

## Assigning

    vars:
      my_var: 123
      my_other_var: ["An", "array", "of", "strings"]
      {{ my_global_var }}: "Something else again"

<!-- ## Registry -->

## Reading

- an inline command like

        steps:
          - run: mkdir {{ myvar }} && cd {{ myvar }}

- or with a script

        steps:
          - run: devops scripts/some_script.sh

        shell> cat ./scripts/some_script.sh

        #!/bin/bash
        echo {{ my_other_var }}

- or within a package task

        steps:
          - run: devops package some_task
            options:
              some: {{ myvar }}

<!-- ## Scope -->
