---
layout: page
title: Git

---
`devops` lets you manage your servers through Git.  

## Creating a repository

Creating a repository is done through the web interface on the [profile page](https://app.devo.ps/#/user/profile).

Once created the repository is reachable at `git@app.devo.ps:{user}/{repo}` with:

- `{user}`: your login user on `devops`
- `{repo}`: the newly created repo name

__Note__: You need to already have your SSH public key to be able to create a repository.

## Cloning a repository

No magic here!

    git clone git@app.devo.ps:USER/REPO

## Git folder structure

`devops` expect the following file structure:

    ./
    ./nodes/...
    ./tasks/...
    ./scripts/...

Respectively the `nodes`, `tasks` and `scripts` folders need to hold your ... nodes, tasks, scripts files.

In each of the folders are provided sample files that can be used as references to create the definitions.

## Nodes

Nodes are described more in detail [here](/manual/Nodes.html).

## Tasks

Tasks are described more in detail [here](/manual/Tasks.html).

## Scripts

Scripts are described more in detail [here](/manual/Scripts.html).