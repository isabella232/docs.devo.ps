---
title: Nodes
---

A node is anything from a server to a firewall. 

*Currently, devo.ps only support servers but we are actively working on adding support for load balancers, firewall and clusters.*

## Node file

Each node is defined in a YAML (`.yml`) file.

*We currently require that you name the file as the node id (see example) and save it in the `nodes/` folder. We are working on adding support for arbitrary file names and folders, allowing you to save multiple nodes in a single file.*

For example, we could add a `web.yml` file with the following content:

    id: web
    name: Web server

    provider:
      type: digitalocean
      size: 66
      location: 3
      image: ubuntu13.10    

    services: {}
    configuration: {}

Once pushed to `master`, this will provision a 512MB Ubuntu server on Digital Ocean (using the [provider credentials defined in your profile](/concepts/profile#providers)) in their `San Francisco 1` datacenter (location and size values are [documented in the provider section](/providers/digital_ocean/)).

### Format

<dl>
  <dt><code><span class='type'>string</span> id</code></dt>
  <dd>The id of the node, currently has to match the file name</dd>

  <dt><code><span class='type'>string</span> name</code></dt>
  <dd>The name of the server as displayed in the Web UI and CLI</dd>

  <dt><code><span class='type'>string</span> type</code></dt>
  <dd>Type of the node, currently only `server` is supported</dd>
  
  <dt class='optional'><code><span class='type'>boolean</span> disabled</code></dt>
  <dd>If `true`, this server is not provisioned (useful to remove temporarily a box for example). Default to `false`.</dd>

  <dt><code><span class='type'>object</span> provider</code></dt>
  <dd>
    The provider information for the node, used for provisioning.
    <dl>
      <dt><code><span class='type'>string</span> type</code></dt>
      <dd>The id of the provider you want to use. We currently support Digital Ocean ([digitalocean](/providers/digitalocean)), EC2 ([ec2](/providers/ec2)), Linode ([linode](/providers/linode)) and Rackspace ([rackspace](/providers/rackspace))</dd>
      <dt><code><span class='type'>integer</span> size</code></dt>
      <dd>id of the server size to use, as defined in the provider's documentation.</dd>
      <dt><code><span class='type'>integer</span> location</code></dt>
      <dd>id of the location (datacenter) to use, as defined in the provider's documentation.</dd>
      <dt><code><span class='type string'>string</span> image</code></dt>
      <dd>id of the image (OS) you want to use.</dd>
    </dl>
  </dd>

  <dt class='optional'><code><span class='type'>array</span> services</code></dt>
  <dd>The list of services to be installed on the node; available services are documented in the **Services** section.</dd>

  <dt class='optional'><code><span class='type'>object</span> services</code></dt>
  <dd>A list of configuration settings to apply to the installed services, as defined in each service's documentation page.</dd>
</dl>

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


You can access your server with the following command (with `{user}` being your devops username):

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
