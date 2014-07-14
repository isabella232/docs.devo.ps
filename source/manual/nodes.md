---
title: Nodes
---

A node is anything from a server to a firewall. 

*Currently, devo.ps only support servers but we are actively working on adding support for load balancers, firewalls and clusters.*

## Node file

Each node is defined in a YAML (`.yml`) file.

*We currently require that you name the file as the node id (see example) and save it in the `nodes/` folder. We are working on adding support for arbitrary file names and folders, allowing you to save multiple nodes in a single file.*

For example, we could add a `web.yml` file with the following content:

    id: nodejs_server
    name: Node.js server
    type: server

    provider:
      name: digitalocean
      size: 66
      location: 3
      image: ubuntu14.04

    services:
      nodejs: '*'
      nginx: '*'

    configuration:
      nodejs:
        packages:
          - gulp
          - forever
          - bower      

Once pushed to `master`, this will provision a 512MB Ubuntu server on Digital Ocean (using the [provider credentials defined in your profile](/manual/profile#providers)) in their `San Francisco 1` datacenter (location and size values are [documented in the provider section](/providers/digital_ocean/)). It will also install [Nginx](/services/nginx) and [Node.js](/services/nodejs) and additionally add the the `gulp`, `forever` and `bower` packages to Node.js.

### Format

<dl>
  <dt><code><span class='type'>string</span> id</code></dt>
  <dd>The id of the node, currently has to match the file name.</dd>

  <dt><code><span class='type'>string</span> name</code></dt>
  <dd>The name of the server as displayed in the Web UI and CLI.</dd>

  <dt><code><span class='type'>string</span> type</code></dt.>
  <dd>Type of the node, currently only `server` is supported.</dd>

  <dt><code><span class='type'>object</span> provider</code></dt>
  <dd>
    The provider information for the node, used for provisioning.
    <dl>
      <dt><code><span class='type'>string</span> type</code></dt>
      <dd>The id of the provider you want to use. We currently support Digital Ocean ([digitalocean](/providers/digitalocean)), EC2 ([ec2](/providers/ec2)), Linode ([linode](/providers/linode)) and Rackspace ([rackspace](/providers/rackspace)).</dd>
      
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

## SSH keys & Users

A `devops` user is created on all servers provisioned by devo.ps. This user is used by our service to maintain your servers (add services, update configuration...) and orchestrate [tasks](/manual/tasks).

Additionally, we add the [SSH keys defined in the profile](/manual/profile#ssh) of all collaborators to the server's `authorized_keys` file for the `devops` user. This means you can log in as the `devops` user by simply running the following command:

<code class='terminal pre'>ssh devops@{IP ADDRESS}</code>

*The IP address can be retrieved both from the Web UI (in the node's details) or using the CLI.*

If you have installed the [CLI](/manual/CLI.html), you can also use one of the following commands:

- From anywhere on your workstation:

    <code class='terminal pre'>devops ssh --repo={REPOSITORY} {NODE_ID}</code>

    Where `{REPOSITORY}` is the name of the repository and `{NODE_ID}` the id of the node you want to log into.

- From within the local repository clone:

    <code class='terminal pre'>devops ssh {NODE_ID}</code>

    *If you only have 1 node in the repository, `devops ssh` would suffice.*

## Read also

- [Git operations]()
- [Git ]()
- [How to create, edit and delete a node](/guides/managing-nodes)