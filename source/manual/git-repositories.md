---
title: Git & Repositories
---

## Repositories 

devo.ps allows you to create Git repositories. Each repository can contain any number of nodes, tasks and scripts. These can only reference each other; for example, a task may not refer to the variables or nodes defined in another repository. You can add a repository from the profile page.

### Files & Folders

We recommend you organize your repositories in three subfolders:

- `nodes/` contains nodes files (servers),
- `scripts/` contains scripts (shell, Ruby, Python...),
- `tasks/` contains tasks files,

*We currently require you to use the folder structure but will be soon allowing users to use any kind of organization.*

Folder can contain subfolders. Nodes and tasks files must be `.yaml` or `.yml` files, scripts should be `.sh`, `.py` or `.rb`. We also support README files; either `README.md`, `README.txt` or `README` will work.

### Branches

Branches of a repository can be **active**. For every active branch, devo.ps will try and provision nodes and run tasks as opposed to inactive branches. [Validation](#validation) only happens on active branches.

*We currently only allow the master branch to be active.*

### Collaborators

You can invite any number of devo.ps users as collaborators: they will have read and write access to the repository but won't be able to either read your profile information (cloud provider keys) or change the repository settings (collaborators and active branches).

*We are currently adding more granular permission management allowing to manage teams and delegate admin permissions to other users.*

## Git

### URL

Each repository is available at `git@app.devo.ps:{USER}/{REPO}` where `{USER}` is the username of the repository's owner and `{REPO}` is the repository's name. To clone this repository on your loca, simply run:

<code class='terminal pre'>git clone</code>

### Validation

Whenever you `git push` your local changes, we run the committed files through a validation step (if the branch you're working is active). If the validation fails, the push command will fail with an error informing you of the potential issue.

### Operations

- **Add a file**; if the file is a node, we will attempt to provision it using the cloud provider key provided in the profile of the repository's owner. For a task, the triggers (webhook or other) will be added and the task will start being run as soon as one of them is triggered.

- **Remove a file**; if the file is a node, we will effectively attempt to decommission the server, which means **you will loose all data stored on the node**. Task will simply be removed and no new run will be added. If a task is removed while running, the run will finish.

    *We are currently implementing more advanced storage features which will allow you to backup and snapshot your data (files and database) before deleting a node.

- **Update a file**; for nodes, the configuration will be adjusted. If this involves changing the provider or a change in size that requires to provision a new box, we will first destroy the existing node before re-provisioning a new one.