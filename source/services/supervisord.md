---
configuration:
  inet:
    description: Enable HTTP support for managing Supervisord (not enabled by default)
    options:
      password:
        default: null
        description: The password required for authentication to this HTTP server.
          This can be a cleartext password, or can be specified as a SHA-1 hash if
          prefixed by the string {SHA}
        required: false
        type: string
      port:
        default: 127.0.0.1:9001
        description: A TCP host:port value or (e.g. 127.0.0.1:9001) on which Supervisord
          will listen for HTTP/XML-RPC requests
        required: false
        type: string
      username:
        default: null
        description: Username required for authentication to this HTTP server.
        required: false
        type: string
    type: object
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
        description: Space separated list of environment variables to provide to the
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
- messagebus
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
      description: Space separated list of environment variables to provide to the
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
