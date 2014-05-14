---
layout: page
title: Nodes

---
## Overview

Nodes are the core component of `devops`, to make it simple, you can consider a `node` is a server.  

Nodes are described in a yaml format, with 1 node per file. Nodes files must be saved in the `nodes` folder.

## File format

A node is described in a YAML file. It __must__ be named as the node.id.

    shell> cat ./nodes/myserver.yml
    
    ---
    id: myserver
    name: My Awesome Server
    type: server
    disabled: false

    provider:
      type: digitalocean
      size: 66
      region: 3
      image: ubuntu13.10    

    services: {}
    configuration: {}


### Format details


Key | Type | Required | Default | Description
--- | --- | --- | --- | ---
**id** | `string` | `true` | | The ID of the node, it must match the filename
**name** | `string` | `true` | | The name of the server, will appear on the web interface
**type** | `string` | `true` | |Type of the node, currently only `server` is supported
**disabled** | `bool` | `false` | `false` | Whether or not consider the node as disabled
**provider** | `object` | `true` | | The provider's detail of the node, used on provisioning, see the [providers references](/references/providers.html) for more details
**services** | `object` | `true` | | The services to install on the node, see the References section for the list of supported services
**configuration** | `object` | `true` | | The configuration for each of the services defined in the `services`


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

## Users on node

Several users are created on the server:

- `devops`: is used by the devops platform to
  - maintain your server in sync with its YAML definition
  - execute [tasks](/manual/Tasks.html)
- `{user}`: is created for you to get access to the server. 
  - `{user}` is your username on the devo.ps website. 
  - The SSH public keys defined in your profile have been added to the `authorized_keys`. 
- `{collaborators}`: one user per collaborator of your git repository is created on the server; for example if `bob` and `alice` are collaborator on your `myrepo` repository, they will also be able to access the server.

## Access to the node

The access to the node is provided over SSH. The IP address is available on the web interface on the node details page.

You can access your server with the following command:

```
ssh {user}@{ip_address}
```

If you have installed the [CLI](/manual/CLI.html), you can also use the following commands:

```
# From anywhere on your workstation
devops ssh --repo=repo node_id

# From your repo folder (the repo is guessed from there)
devops ssh node_id

# Even simpler if you only have 1 node defined and you are in your repo folder...
devops ssh
```