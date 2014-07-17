---
title: Variables
---

Variables, usually refered to as `vars`, refers to the services configuration, meta data and services configuration, ID address, size )

## Assigning and Reading

## Registry

## Scope

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
steps:
  - run: mkdir {{ myvar }} && cd {{ myvar }}
```

- or with a script

```
steps:
  - run: devops scripts/some_script.sh

shell> cat ./scripts/some_script.sh

#!/bin/bash
echo {{ my_other_var }}
```

- or within a package task

```
steps:
  - run: devops package some_task
    options:
      some: {{ myvar }}
```
