---
layout: page
title: Tasks

---
## Overview

Tasks are the core component of `devops`, to make it simple, you can consider a `task` as a list of operations to run on demand.  

Tasks are described in a yaml format, with 1 task per file. Tasks files must be saved in the `tasks` folder.

## File format

A task is described in a YAML file. It __must__ be named as the task.id.

```
shell> cat ./tasks/mytask.yml

---
id: mytask
name: My Awesome Task
type: task

vars:
  myvar: something

when:
  webhook:
    - path: super/secret/path

'on':
  - myserver

do:
  - run: echo {{ myvar }}
  - run: devops ./scripts/myscript.sh
    'on':
      - myserver2
  - run: devops package task
    options:
      some: option
```

### Format details


Key | Type | Required | Default | Description
--- | --- | --- | --- | ---
**id** | `string` | `true` | | The ID of the task, it must match the filename
**name** | `string` | `true` | | The name of the task, will appear on the web interface
**type** | `string` | `true` | | Type of the task, currently only `task` is supported
**vars** | `object` | `false` | | A list of variables to use thorough the task (see the vars section below)
**when** | `object` | `false` | | When to automatically trigger this task (see the when section below)
**'on'** | `array` | `false` | | List of nodes to run the task on by default if not defined within a command. **Note**: beware of the quotes around the `'on'` key
**do** | `array` | `true` | | Sequence of command to run, the execution flow stops on failure of a command

### do

The `do` attribute defines the core of the task; the sequence of commands to run. 

3 types of commands exist:

- **inline commands**: commands you would be able to run as if you were on the server (e.g. `mkdir folder`)


```
do:
  - run: mkdir folder
```

- **script execution**: you can call scripts that you have created in the `./scripts` folder and get it executed on the remote server. Obviously if the script doesn't exist the command will fail. More details about the scripts available [here](/manual/Scripts.html)

```
do:
  - run: devops scripts/some_script.sh
```

- **devops tasks**: services that you have installed on your nodes come with a set of prepared tasks that you can run easily with little configuration. For example creating a custom virtual host for nginx. The format of the command is as such `devops {service} {task}`. Some of those tasks have options, you can find all the details in the [references](/references) for each service.

```
do:
  - run: devops nginx vhost add
    options:
      domain: example.com
      port: 80
      routes:
        - uri: /
          type: proxy
          to: http://localhost:3000
```

### Vars

The `vars` attribute define a list of variables that can be use anywhere in the future commands.

For example:

```
vars:
  myvar: value
  my_other_var: other_value
```

Allows you to use `{{ myvar }}` and `{{ my_other_var }}` in either:

- an inline command like

```
do:
  - run: mkdir {{ myvar }} && cd {{ myvar }}
```

- or with a script

```
do:
  - run: devops scripts/some_script.sh

shell> cat ./scripts/some_script.sh

#!/bin/bash
echo {{ my_other_var }}
```

- or within a package task

```
do:
  - run: devops package some_task
    options:
      some: {{ myvar }}
```

### On

The `'on'` attribute lets you define the list of nodes to run the command on. You can specify it either at the command level, or at the root level. 

If no `'on'` attribute is available within a command, it will fallback on the root `'on'` attribute. 

If there is no `'on'` attribute at all (no root-level attribute either) - the system will not know where to run the task and will fail.

The node list provided in the `'on'` attribute need to exist on the platform and be defined in your repo. If they don't the task will fail.

```
'on':
  - myserver
  - my_other_server
do:
  # will run on the root node list
  - run: echo ipsum
  # will only run on the list provided
  - run: echo lorem
    'on': ['my_third_server']
```

**Note**: `on` can be easily interpreted as a boolean (on/off) by the Yaml parser, you need to put it in quote to ensure it will be considered as a string.

### When

The `when` attribute lets you define when do you want a task to be triggered and executed.

The supported events are:

- manual (always available)
- webhook

#### Webhooks

Lets you define a webhook that you (or a third party) can call anytime to trigger an execution of the task.

The only HTTP valid method is `POST`.

```
when:
  webhook:
    - path: some/secret/url
    - path: some/even/more/secret/url
```

The final effective URL path is constructed as follow:

```
https://app.devo.ps/webhook/{user}/{repo}/some/secret/url
https://app.devo.ps/webhook/{user}/{repo}/some/even/more/secret/url
```

## Git operations

### On push - File validation

On `git push`, the file will be parsed and validated by the `devops` platform. If the file is not valid, the push will be rejected. You will need to fix the file before pushing again.

### File creation

On commit / push of a new task on git, the task will:

- get its webhooks path registered

### File delete

Removing a task from the repository will unregister the webhooks path from the devops platform

### File update

Updating the list of commands, updating the list of nodes the task will run on will be in effect immediately. They will be used at the next run of the task.

Updating `when` the task is ran will automatically refresh *when* the task should be ran and the changes will be available immediately.