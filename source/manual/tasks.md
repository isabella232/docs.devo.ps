---
title: Tasks
---

Tasks are simple sequences of commands performed on designed [nodes](/manual/nodes) of a repository upon certain events (aka "triggers").

## Task file

As with nodes, you define a task using a simple YAML (`.yml`) file.

*We currently require that you name the file as the task id (see example) and save it in the `tasks/` folder. We are working on adding support for arbitrary file names and folders, allowing you to save multiple tasks in a single file.*

For example, we could add a `task.yml` file with the following content:

    id: deploy
    type: task
    name: Deployment pipeline

    triggers:
      webhooks:
        - deploy
    
    targets:
      - nodejs_server
    
    vars:
      build: /opt/build_temp
      domain: example.com
    
    steps:
      - run: sudo mkdir -p {{ build }} && sudo chown -R devops. {{ build }}
      - run: devops git clone
        options:
          from: https://github.com/Wiredcraft/octokan.com.git
          to: {{ build }}
          version: master
      - run: cd {{ build }}; make build ; cp -a _site/* /var/www/{{ domain }}
      - run: devops nginx vhost add
          options:
            domain: {{ domain }}
            port: 80
            routes:
              - uri: /
                type: proxy
                to: http://localhost:3000

### Format

<dl>
  <dt><code><span class='type'>string</span> id</code></dt>
  <dd>The id of the task, currently has to match the file name.</dd>

  <dt><code><span class='type'>string</span> name</code></dt>
  <dd>The name of the task as displayed in the Web UI and CLI.</dd>

  <dt><code><span class='type'>string</span> type</code></dt>
  <dd>Must be set to `task`, defines this file as a task.</dd>
  
  <dt class='optional'><code><span class='type'>object</span> vars</code></dt>
  <dd>Used to define a list of variables local to the task. Useful to define values you want to use in the steps (see belows).</dd>

  <dt class='optional'><code><span class='type'>object</span> triggers</code></dt>
  <dd>A list of events upon which to run the task. Currently only supports manual trigger and webhooks. <a href='#triggers'>Read more about triggers below</a>.</dd>

  <dt><code><span class='type'>object</span> targets</code></dt>
  <dd>A list of nodes id on which to run the task.</dd>

  <dt><code><span class='type'>object</span> steps</code></dt>
  <dd>
    A series of commands and tasks to be run one after the other.
    <dl>
      <dt><code><span class='type'>string</span> run</code></dt>
      <dd>A command to be run; it may be an inline shell command, the path to one of the [scripts](/manual/scripts) available in the repository or a `devops` command. <a href='#steps'>Read more about steps below</a>.</dd>
      
      <dt class='optional'><code><span class='type'>object</span> options</code></dt>
      <dd>An object of options to be passed to the command if it is a devops command.</dd>

      <dt><code><span class='type'>object</span> targets</code></dt>
      <dd>A list of nodes id on which to run the command. **This takes precedence over the targets defined at the root of the task**.</dd>
    </dl>
  </dd>
</dl>

### Steps

The `steps` attribute defines the series of commands that composes the task. These commands can be of 3 kinds:

- **Inline command**: regular shell command. For example:

      steps:
        - run: mkdir folder

- **Script**: you can define shell scripts in the `scripts/` folder, making it convenient to reuse commands across multiple tasks or simply isolate a complex set of commands. For example:

      steps:
        - run: devops scripts/some_script.sh

    *Notice the call to the `devops` keyword at the beginning of the command which we use as well for the last kind of command.*

- **devops command**: services installed on your nodes usually come with some helper commands. A devops command looks like `devops {SERVICE} {COMMAND}` where `{SERVICE}` is the name of the service and `{COMMAND}` the name of the specific command. Some of these commands require you to define options. For example, adding a virtual host to your Nginx service can be done as follow:

      steps:
        - run: devops nginx vhost add
          options:
            domain: example.com
            port: 80
            routes:
              - uri: /
                type: proxy
                to: http://localhost:3000

    *As for the scripts, we use the `devops` keyword. Services documentations dislpay a "Tasks" section if they have commands. See for example [Nginx list of commands](/services/nginx#tasks).*

### Triggers

Tasks are ran every time one of the triggers is... well triggered.

*We currently only support manual and webhook triggers. We are working on adding support for cron and 3rd party events (GitHub, TravisCI, NewRelic...). Webhooks are however flexible enough that you should be able to integrate most 3rd parties already.*

#### Webhook

Lets you define a webhook that you (or a third party) can call anytime to trigger an execution of the task.

The only HTTP valid method is `POST`.

```
triggers:
  webhooks:
    - path: some/secret/url
    - path: some/even/more/secret/url
```

The final effective URL path is constructed as follow:

```
https://app.devo.ps/webhooks/{user}/{repo}/some/secret/url
https://app.devo.ps/webhooks/{user}/{repo}/some/even/more/secret/url
```

## Users

By default all the commands are executed by the `devops` user. You can however switch user by using the `sudo` command for either *inline commands* or *scripts*:

- For **inline commands** you can prefix the command with the following:

      steps:
        # Run as root
        - run: **sudo** mkdir -p /opt/mystuff && **sudo** chown devops. /opt/mystuff
        # Run as a different user
        - run: **sudo -u {other_user}** mkdir /tmp/test

- **scripts**: if you want to switch user, you need to use the sudo command **within** your script, as such:

      steps:
        - run: devops scripts/myscript.sh
      
      shell> cat ./scripts/myscript.sh
      #!/bin/bash
      # Run as root
      sudo mkdir /opt/folder
      sudo chown devops. /opt/folder
      
      # This will succeed now and executed as devops
      touch /opt/folder/file
      
      # Create folder and file as other_user
      sudo -u {other_user} mkdir /tmp/other
      sudo -u {other_user} touch /tmp/other/file
      
      # This will fail as the folder is owned by other_user
      touch /tmp/other/file2