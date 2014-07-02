---
configuration:
  event:
    maxclients:
      default: 150
      description: Maximum number of simultaneous client connections
      minimum: 0
      required: false
      type: integer
    maxrequestsperchild:
      default: 0
      description: Maximum number of requests a server process serves.
      minimum: 0
      required: false
      type: integer
    maxsparethreads:
      default: 75
      description: Maximum number of worker threads which are kept spare.
      minimum: 0
      required: false
      type: integer
    minsparethreads:
      default: 25
      description: Minimum number of worker threads which are kept spare,
      minimum: 0
      required: false
      type: integer
    startservers:
      default: 5
      description: Initial number of server processes to start.
      minimum: 0
      required: false
      type: integer
    threadlimit:
      default: 64
      description: ThreadsPerChild can be changed to this maximum value during a graceful
        restart. ThreadLimit can only be changed by stopping and starting Apache.
      minimum: 0
      required: false
      type: integer
    threadsperchild:
      default: 25
      description: Constant number of worker threads in each server process.
      minimum: 0
      required: false
      type: integer
  group:
    default: www-data
    description: Apache running group.
    required: false
    type: string
  keepalive:
    default: true
    description: Whether or not to allow persistent connections.
    enum:
    - true
    - false
    - true
    - false
    required: false
    type: string
  keepalivetimout:
    default: 5
    description: Number of seconds to wait for the next request from the same client
      on the same connection.
    minimum: 0
    required: false
    type: integer
  maxkeepaliverequests:
    default: 100
    description: The maximum number of requests to allow during a persistent connection.
    minimum: 0
    required: false
    type: integer
  prefork:
    maxclients:
      default: 150
      description: Maximum number of server processes allowed to start.
      minimum: 0
      required: false
      type: integer
    maxrequestsperchild:
      default: 4000
      description: Maximum number of requests a server process serves.
      minimum: 0
      required: false
      type: integer
    maxspareservers:
      default: 10
      description: Maximum number of server processes which are kept spare.
      minimum: 0
      required: false
      type: integer
    minspareservers:
      default: 2
      description: Minimum number of server processes which are kept spare.
      minimum: 0
      required: false
      type: integer
    startservers:
      default: 5
      description: Number of server processes to start.
      minimum: 1
      required: false
      type: integer
  timeout:
    default: 300
    description: The number of seconds before receives and sends time out.
    minimum: 0
    required: false
    type: integer
  user:
    default: www-data
    description: Apache running user.
    required: false
    type: string
  worker:
    maxclients:
      default: 150
      description: Maximum number of simultaneous client connections
      minimum: 0
      required: false
      type: integer
    maxrequestsperchild:
      default: 0
      description: Maximum number of requests a server process serves.
      minimum: 0
      required: false
      type: integer
    maxsparethreads:
      default: 75
      description: Maximum number of worker threads which are kept spare.
      minimum: 0
      required: false
      type: integer
    minsparethreads:
      default: 25
      description: Minimum number of worker threads which are kept spare,
      minimum: 0
      required: false
      type: integer
    startservers:
      default: 5
      description: Initial number of server processes to start.
      minimum: 1
      required: false
      type: integer
    threadlimit:
      default: 64
      description: ThreadsPerChild can be changed to this maximum value during a graceful
        restart. ThreadLimit can only be changed by stopping and starting Apache.
      minimum: 0
      required: false
      type: integer
    threadsperchild:
      default: 25
      description: Constant number of worker threads in each server process.
      minimum: 0
      required: false
      type: integer
documentation: http://httpd.apache.org/docs/
tags:
- web
title: Apache

---

## Examples

### Configuration

```example
services:
  apache: '*'
configuration:
  apache:
    timeout: 60
    prefork:
      maxclients: 20
      maxrequestsperchild: 1000
```

The example above will install Apache on the node, set the timeout to 60 seconds and set prefork MPM to start a maximum of 20 child processes handling 1000 requests maximum each.

### Task

```example
steps: blah
```

## Tasks

<table>
<thead>
<tr>
<th>Task</th>
<th>Options</th>
<th>Description </th>
</tr>
</thead>
<tbody>
<tr>
<td><code>start</code></td>
<td>-</td>
<td>Start sthe Apache service, it does not do anything if it is already running.</td>
</tr>
<tr>
<td><code>stop</code></td>
<td>-</td>
<td>Stops the Apache service, it does not do anything if it is already stopped.</td>
</tr>
<tr>
<td><code>restart</code></td>
<td>-</td>
<td>Restarts the Apache service, killing existing HTTP connections. Use <code>reload</code> to avoid killing existing connections.</td>
</tr>
<tr>
<td><code>reload</code></td>
<td>-</td>
<td>Gracefully restarts the Apache service, reloading the configuration.</td>
</tr>
<tr>
<td><code>add vhost</code></td>
<td><code>Object</code></td>
<td>Adds a virtual host to the Apache configuration.</td>
</tr>
</tbody>
</table>