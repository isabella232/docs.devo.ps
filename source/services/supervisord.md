---
configuration:
  inet:
    password:
      default: null
      description: The password required for authentication to this HTTP server. This
        can be a cleartext password, or can be specified as a SHA-1 hash if prefixed
        by the string {SHA}
      required: false
      type: string
    port:
      description: A TCP host:port value or (e.g. `127.0.0.1:9001`) on which Supervisord
        will listen for HTTP/XML-RPC requests
      required: false
      type: string
    username:
      default: null
      description: Username required for authentication to this HTTP server.
      required: false
      type: string
  nodaemon:
    default: false
    description: Define whether or not run the Supervisord service as a daemon or
      not
    required: false
    type: boolean
  programs:
    default: []
    description: array of programs managed by Supervisord
    options:
      autostart:
        default: true
        description: Choose whether the application should be executed automatically
          on start.
        required: false
        type: boolean
      command:
        description: Command to execute. It must be executed in foreground.
        required: true
        type: string
      env:
        default: null
        description: Comma separated list of environment variables to provide to the
          command on execution.
        required: false
        type: string
      extra:
        description: Any parameter (line seperated) supported by Supervisord for the
          programs (http://supervisord.org/configuration.html#program-x-section-settings)
        required: false
        type: string
      log:
        description: Log related details.
        options:
          stderr:
            description: Path to the log file that will save the command stderr
            required: false
            type: string
          stdout:
            description: Path to the log file that will save the command stdout
            required: false
            type: string
        required: false
        type: object
      name:
        description: Name of the program to add.
        required: true
        type: string
      user:
        default: root
        description: Running user for the command.
        required: false
        type: string
    type: array
documentation: http://supervisord.org/configuration.html
tags:
- daemon
tasks:
- description: Restart the Supervisord service.
  name: restart
- description: Start the Supervisord service if stopped.
  name: start
- description: Stop the Supervisord service if running.
  name: stop
- description: Add a new program to Supervisord.
  name: program add
  options:
    autostart:
      default: true
      description: Choose whether the application should be executed automatically
        on start.
      required: false
      type: boolean
    command:
      description: Command to execute. It must be executed in foreground.
      required: true
      type: string
    env:
      default: null
      description: Comma separated list of environment variables to provide to the
        command on execution.
      required: false
      type: string
    extra:
      description: Any parameter (line seperated) supported by Supervisord for the
        programs (http://supervisord.org/configuration.html#program-x-section-settings)
      required: false
      type: string
    log:
      description: Log related details.
      options:
        stderr:
          description: Path to the log file that will save the command stderr
          required: false
          type: string
        stdout:
          description: Path to the log file that will save the command stdout
          required: false
          type: string
      required: false
      type: object
    name:
      description: Name of the program to add.
      required: true
      type: string
    user:
      default: root
      description: Running user for the command.
      required: false
      type: string
- description: Remove an existing program from Supervisor.
  name: program remove
  options:
    name:
      description: Name of the program to remove. It should match one that was previously
        created.
      required: true
      type: string
- description: Restart a program managed by Supervisord.
  name: program restart
  options:
    name:
      description: Name of the program to restart.
      required: true
      type: string
- description: Start a program managed by Supervisord.
  name: program start
  options:
    name:
      description: Name of the program to start.
      required: true
      type: string
- description: Stop a program managed by Supervisord.
  name: program stop
  options:
    name:
      description: Name of the program to stop.
      required: true
      type: string
title: Supervisord

---
Supervisor is a client/server system that allows its users to monitor and control a number of processes on UNIX-like operating systems.

It can be used to manage any type of process, from custom python code to node.js application.

## Examples

* ### Node.js app

  ```example
  configuration:
    supervisord:
      programs:
        - name: api
          user: nobody
          command: node app.js
          env: NODE_ENV=prod,MANDRILL_API_KEY=qwerty
          extra: |
            directory = /opt/api
            autorestart = true
  ```

  We here define a node.js application that will run as `nobody` user, execute the `app.js` code from the `/opt/api` folder. It will restart automatically no matter how. Both `NODE_ENV` and `MANDRILL_API_KEY` environment variable will be passed along to the running process.

* ### Python app

  ```example
  configuration:
    supervisord:
      programs:
        - name: app
          user: nobody
          command: python /opt/my_app/app.py
          env: DEBUG=true
  ```

  We here define a simple program that will execute `app.py` as nobody, passing the `DEBUG` environment variable along.

* ### Custom app

  ```example
  configuration:
    supervisord:
      programs:
        - name: consul
          command: /bin/consul agent -config-dir /etc/consul.d/
  ```

  We here define a simple program that will execute a custom command; in this case the `consul` agent as root.

## Parameters

Supervisord has dozens of available options, but for improved user experience we only selected a few that we considered essential enough for having their dedicated devo.ps attribute. You can check below for the available options.

You can however extensively customize your program execution by using the `extra` option. Note that with the `Yaml` format of the server (and task), you need to use the proper "scalar" to maintain the proper new-line character.

```example
supervisord:
  programs:
    ...
      extra: |
        first = parameter
        second = parameter
```

Note the `|` after `extra:`, it will ensure both lines below are effectively treated as lines (instead of space separated strings of a larger `extra` string). See the [official YAML documentation](http://www.yaml.org/spec/1.2/spec.html#id2760844) for more details about the scalars format.
