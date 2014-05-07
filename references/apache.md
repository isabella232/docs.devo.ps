---
title: Apache
layout: page
links:
    - title: Official website
      icon: 
      url: http://httpd.apache.org/
configuration:
    - title: user
      default: www-data
      description: Apache running user.
      type: string
      required: false
    - title: group
      default: www-data
      description: Apache running group.
      type: string
      required: false
    - title: timeout
      default: 300
      description: The number of seconds before receives and sends time out.
      type: integer
      required: false
      minimum: 0
    - title: keepalive
      default: true
      description: Whether or not to allow persistent connections.
      type: string
      required: false
      enum: true,false,true,false
    - title: maxkeepaliverequests
      default: 100
      description: The maximum number of requests to allow during a persistent connection.
      type: integer
      required: false
      minimum: 0
    - title: keepalivetimout
      default: 5
      description: Number of seconds to wait for the next request from the same client on the same connection.
      type: integer
      required: false
      minimum: 0
    - title: prefork
      subtree:
          - title: startservers
            default: 5
            description: Number of server processes to start.
            type: integer
            required: false
            minimum: 1
          - title: minspareservers
            default: 2
            description: Minimum number of server processes which are kept spare.
            type: integer
            required: false
            minimum: 0
          - title: maxspareservers
            default: 10
            description: Maximum number of server processes which are kept spare.
            type: integer
            required: false
            minimum: 0
          - title: maxclients
            default: 150
            description: Maximum number of server processes allowed to start.
            type: integer
            required: false
            minimum: 0
          - title: maxrequestsperchild
            default: 4000
            description: Maximum number of requests a server process serves.
            type: integer
            required: false
            minimum: 0
    - title: worker
      subtree: 
        - title: startservers
          default: 5
          description: Initial number of server processes to start.
          type: integer
          required: false
          minimum: 1
        - title: minsparethreads
          default: 25
          description: Minimum number of worker threads which are kept spare,
          type: integer
          required: false
          minimum: 0
        - title: maxsparethreads
          default: 75
          description: Maximum number of worker threads which are kept spare.
          type: integer
          required: false
          minimum: 0
        - title: threadlimit
          default: 64
          description: ThreadsPerChild can be changed to this maximum value during a graceful restart. ThreadLimit can only be changed by stopping and starting Apache.
          type: integer
          required: false
          minimum: 0
        - title: threadsperchild
          default: 25
          description: Constant number of worker threads in each server process.
          type: integer
          required: false
          minimum: 0
        - title: maxclients
          default: 150
          description: Maximum number of simultaneous client connections
          type: integer
          required: false
          minimum: 0
        - title: maxrequestsperchild
          default: 0
          description: Maximum number of requests a server process serves.
          type: integer
          required: false
          minimum: 0
    - title: event
      subtree: 
          - title: startservers
            default: 5
            description: Initial number of server processes to start.
            type: integer
            required: false
            minimum: 0
          - title: minsparethreads
            default: 25
            description: Minimum number of worker threads which are kept spare,
            type: integer
            required: false
            minimum: 0
          - title: maxsparethreads
            default: 75
            description: Maximum number of worker threads which are kept spare.
            type: integer
            required: false
            minimum: 0
          - title: threadlimit
            default: 64
            description: ThreadsPerChild can be changed to this maximum value during a graceful restart. ThreadLimit can only be changed by stopping and starting Apache.
            type: integer
            required: false
            minimum: 0
          - title: threadsperchild
            default: 25
            description: Constant number of worker threads in each server process.
            type: integer
            required: false
            minimum: 0
          - title: maxclients
            default: 150
            description: Maximum number of simultaneous client connections
            type: integer
            required: false
            minimum: 0
          - title: maxrequestsperchild
            default: 0
            description: Maximum number of requests a server process serves.
            type: integer
            required: false
            minimum: 0
---

The Number One HTTP Server On The Internet

The Apache HTTP Server Project is an effort to develop and maintain an
open-source HTTP server for modern operating systems including UNIX and
Windows NT. The goal of this project is to provide a secure, efficient
and extensible server that provides HTTP services in sync with the
current HTTP standards.

Apache httpd has been the most popular web server on the Internet since
April 1996, and celebrated its 17th birthday as a project this February.

The Apache HTTP Server ("httpd") is a project of The Apache Software
Foundation.

## Example

    services:
      apache: '*'
    configuration:
      apache:
        user: root
        worker:
          startservers: 1

