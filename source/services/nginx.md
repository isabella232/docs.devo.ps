---
configuration:
  events:
    worker_connections:
      default: 1024
      description: Number of concurrent http connection handled per nginx process
      minimum: 1
      required: false
      type: integer
  http:
    access_log:
      default: /var/log/nginx/access.log
      description: Global access log file path
      required: false
      type: string
    error_log:
      default: /var/log/nginx/error.log
      description: Global error log file path
      required: false
      type: string
    gzip:
      default: 'on'
      description: Enable gzip compression
      required: false
      type: string
    gzip_disable:
      default: msie6
      description: Space separated list of browser to disable gzip compression for
      required: false
      type: string
    keepalive_timeout:
      default: 65
      description: Keepalive timeout (sec) - 0 to disable
      minimum: 0
      required: false
      type: integer
    sendfile:
      default: 'on'
      description: Enable sendfile
      required: false
      type: string
    tcp_nodelay:
      default: 'on'
      description: Enable tcp_nodelay
      required: false
      type: string
    tcp_nopush:
      default: 'on'
      description: Enable tcp_nopush
      required: false
      type: string
    types_hash_max_size:
      default: 2048
      description: Maximum size of hash tables
      minimum: 0
      required: false
      type: integer
  pid:
    default: /var/run/nginx.pid
    description: Pid file path
    required: false
    type: string
  user:
    default: www-data
    description: Nginx running user.
    required: false
    type: string
  vhosts:
    default: []
    description: Array of virtual hosts objects
    object_id: vhost
    required: false
    type: array
  worker_processes:
    default: 4
    description: Number of Nginx processes
    minimum: 1
    required: false
    type: integer
documentation: http://wiki.nginx.org/Modules
objects:
  route:
    description: A route object used in a vhost.
    options:
      custom:
        description: Custom inline nginx config to include within the route (e.g.
          auth, custom timeout)
        required: false
        type: string
      static:
        default: root
        description: For type static only, define how to consider the source folder
          - alias or root
        required: false
        type: string
        valid_values: Either of alias / root
      to:
        description: Either an upstream name, or a service / url, or a path
        required: false
        type: string
      type:
        default: custom
        description: The type of handler for that route
        required: false
        type: string
        valid_values: Either of proxy / fastcgi / websocket / uwsgi / static / custom
      uri:
        description: Any string / regex that nginx understand as a `location`
        required: true
        type: string
        valid_values: Any string including regex
  upstream:
    description: An upstream object used in a vhost.
    options:
      backends:
        description: List of backends associated with the upstream
        required: true
        type: array
        valid: TCP URL and Unix socket path
      name:
        description: Name of the upstream - it must be unique on the entire node
        required: true
        type: string
        valid: Unique name on the node
  vhost:
    description: A virtual host object.
    options:
      aliases:
        description: Space separated list of domain name aliases
        required: false
        type: string
      domain:
        default: _
        description: Primary domain name, use '_' as wildcard to respond to every
          domain / IP
        required: false
        type: string
      id:
        description: Virtual host identifier, used to perform lookup in the vhosts
          array. Also used to name the configuration files and the default web root.
        required: false
        type: string
      port:
        default: 80
        description: Listening port (TCP/80 by default, TCP/443 if SSL is enabled)
        required: false
        type: integer
      routes:
        description: List of route objects. The order matters and the routes will
          be applied sequentially.
        object_id: route
        required: true
        type: array
      ssl:
        description: Enable HTTPS
        options:
          certificate:
            default: /etc/nginx/ssl/{domain}.pem
            description: HTTPS certificate file path (chained if needed)
            required: false
            type: string
          private_key:
            default: /etc/nginx/ssl/{domain}.key
            description: Private key file path used to generate the certificate (password-less)
            required: false
            type: string
        required: false
      support:
        description: List of technologies the vhost will support (only 'php' for the
          moment)
        required: false
        type: array
      upstreams:
        description: list of upstream objects
        object_id: upstream
        required: false
        type: array
      webroot:
        description: Subfolder to serve data from based on the root /var/www/_vhost_id_
        required: false
        type: string
tags:
- web
tasks:
- description: Start Nginx if stopped
  name: start
- description: Stop Nginx if started
  name: stop
- description: Reload Nginx, reload the configuration and perform a graceful restart
  name: reload
- description: Restart Nginx, reload the configuration (but kills existing connection)
  name: restart
title: Nginx

---
# Virtual Hosts

In practive virtual hosts allows you to compartment your web files and allow you to run different domains at the same time on the same host.

## Default web roots

The default web roots are created based on the vhost id supploed on creation:

    /var/www/{vhost_id}

Sometime your public files are hosted in a subfolder of the main web root (e.g. `public`), in that case you want to use the `webroot` parameter in the vhost definition. It will be appended to the main webroot. For example, with the following configuration:

    configuration:
      nginx:
        vhosts:
          - id: my_vhost
            webroot: public

The root will be set to `/var/www/my_vhost/public`

## Routes

Routes define how the web server will handle the requests based on the `uri` provided in the request. You can read more about the routes objects below.

Routes will define the `locations` within the nginx configuration file. The order matters, the 1st routes will be processed before the last ones.

There is several types of routes:

- custom (default): allows you to fully specify the content of the location. It usually goes along with the `custom` property where you can specify exactly the content.
- fastcgi: will send the request to a fastcgi backend or upstream. It usually applies to PHP.
- proxy: will send the request to a http proxy, eiter local or remote. It usually applies to backend services like a node.js process, a django service (running as http), etc.
- websocket: will assume the request is meant to be processed as websocket traffic. It will change several of the headers.
- uwsgi: will send the request to a uwsgi service. It typically applies to Python apps.
- static: will simply consider the traffic to be served as-is, and that the files do not require any processing.

## Supported technologies

An extra attribute `support` is available in the definition of a _vhost_; it should list the technologies that this vhost needs to support. 

Currently only `php` is relevant and will change the behavior of the vhost by ensuring the `index` includes `index.php` along with the `index.html` and `index.htm`.

## Example

The following configuration snippet:

    configuration:
      nginx:
        vhosts:
          - id: my_vhost
            port: 8080
            domain: mydomain.com
            aliases: alias.mydomain.com alias2.mydomain.com
            webroot: public
            support:
              - php
            routes:
              - uri: '@php'
                type: fastcgi
                to: localhost:9001
              - uri: '~ ^/(app|app_dev|config)\.php(/|$)'
                type: custom
                custom: >
                  try_files $uri @php

Will generate the following config file in `/etc/nginx/sites-available/my_vhost` (also linked and enabled in `sites-enabled`):

    server {
        listen   8080;
        root /var/www/my_vhost/public;

        index index.php index.html index.htm;

        access_log /var/log/nginx/my_vhost-access.log;
        error_log /var/log/nginx/my_vhost-error.log;

        # Make site accessible from http://localhost/
        # server_name _;
        server_name mydomain.com alias.mydomain.com alias2.mydomain.com;

        location @php {
            # Route type: fastcgi
            fastcgi_pass localhost:9001;
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            # NOTE: You should have "cgi.fix_pathinfo = 0;" in php.ini
            fastcgi_index index.php; 
            include fastcgi_params;
        }

        location ~ ^/(app|app_dev|config)\.php(/|$) {
            # Route type: custom
            try_files $uri @php
        }
    }

