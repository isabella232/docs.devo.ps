---
configuration:
  hostname:
    default:
      node id: null
    description: Custom hostname to set the server to
    required: false
    type: string
  packages:
    default: []
    description: List of packages to install on the server
    required: false
    type: array
  repositories:
    default: []
    description: List of repositories to install on the server
    options:
      key:
        description: Local or remote GPG key used to authenticate the repository
        required: false
        type: string
      name:
        description: Either a ppa repository, or a full line
        required: false
        type: string
    required: false
    type: array
  swap:
    enable:
      default: true
      description: Whether or not to include SWAP on the server
      required: false
      type: boolean
    path:
      default: /swapfile
      description: Path of the SWAP file
      required: false
      type: string
    size:
      default: 2048
      description: Size in MB of the SWAP
      required: false
      type: integer
  sysctl:
    default: {}
    description: 'Key/Value pair of sysctl settings (e.g. vm.swappiness: 1)'
    required: false
    type: object
tags:
- security
tasks:
- description: Restart the server and wait for it to come back online
  name: restart
- description: Stop the server and ... just stops it
  name: stop
title: Server

---
You can perform fine tuning of your node.

## Hostname

By default the hostname of your node will be your node id. You can override the hostname by specifying:

    configuration:
        server:
            hostname: mybox

## Deb Repositories

You can add any custom repository by defining the following:

    configuration:
        server:
            repositories:
                - name: 'ppa:nginx/stable'
                - name: 'deb http://packages.elasticsearch.org/elasticsearch/1.3/debian stable main'
                  key: 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'

## Deb packages

You can install custom DEB packages on your node by defining the following in the configuration:

    configuration:
        server:
            packages:
                - some-package
                - some-other-package

Those packages are expected to be found within the deb packages repositories defined in your node.

## Sysctl settings

You can specify extra parameters to your node with:

    configuration:
        server:
            sysctl:
                vm.swappiness: 10
                net.ipv4.ip_forward: 1

## SWAP settings

By default some swap will be created on the node. This can be disabled or tuned to match your needs.

The following example will change the default size and path, and create a 4GB swap file at `/custom_path`:

    configuration:
        server:
            swap:
                enable: true
                size: 4096
                path: /custom_path

This example, will ensure no swap file is being created

    configuration:
        server:
            swap:
                enable: false
