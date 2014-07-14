---
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



## Git operations

### On push - File validation

On `git push`, the file will be parsed and validated by the `devops` platform. If the file is not valid, the push will be rejected. You will need to fix the file before pushing again.

### File creation

On commit / push of a new node on git, the node will be provisioned on the provider defined in the file.

It will use the cloud provider API credentials defined in your profile. Obviously any attempt to create a node on an invalid provider or on a provider for which no credentials are found in the profile will fail.

### File delete

Removing a node from the repository is interpreted by `devops` as a request to effectively remove the server. The server will be stopped and destroyed.

### File update

Adding or removing a service, updating the configuration of a service will lead to a sync of the node. After a few minutes the node will have the services and configuration as described in the `yaml` file.

__Notes__:

- Modifying the __`provider`__ information will trigger no change (no resize, no migration to another provider); the provider details is only used on provisioning.
- Toggling the __`disabled`__ attribute between `False` and `True` will in practice delete (an existing) / create (a disabled) node. It is a convenient way to keep the node definition in your git repository and use it as a temporary node spawned on demand.