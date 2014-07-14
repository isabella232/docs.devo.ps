---
title: Scripts
---
## Overview

Scripts let you create arbitrary commands that you may want to execute during a task run.

The scripts need to be saved in the `./scripts` folder to be usable by the system, they will then be referenced in the tasks with the following:

```
do:
  - run: devops scripts/{filename}
```

The scripts can be of any language you wish, shell script, python script, ruby script, etc.

## Languages

- shell scripts are natively supported and should be able to run as-is without further customization on the platform
- python / ruby scripts *may* run properly as well, but you probably will run into issues as soon as you want to use `pip` packages or `gems`. You may have to update your node configuration and ensure your system has the required dependencies or packages. Refer to the [python service](/references/python.html) or [ruby service](/references/ruby.html) documentation for more information.

```
services:
  python: '*'
  ruby: '*'
configuration:
  python:
    packages:
      - pyyaml
      - boto
  ruby:
    gems:
      - compass
```

## Using task variables

Scripts can use variables defined in the task under the `vars` attribute, they will need to be put in between curvy brackets ( `{{` and `}}` ).

## Using webhooks - data payload

Tasks can be triggered by webhook, sending a `POST` request on the URL defined in the task. The payload (JSON) of the POST request can be accessed by `{{ payload }}`.

The content of the payload depends on what effectively perform the POST request, it could be any of:

- nothing
- the GitHub payload (if it is triggered by GitHub on webhook), see [GitHub documentation](https://developer.github.com/webhooks/) about the format.
- any custom payload - if called from anywhere else - you are responsible for handling its content securely on your servers.

## Running user

By default and like all the commands ran in the task, the `devops` user will be executing the script on the platform. The `devops` user can get granted `root` access by using the `sudo` command - or any other users for the matter using `sudo -u {other_user} command`.