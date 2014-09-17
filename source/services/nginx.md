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
      indexes:
        default: index.html index.htm
        description: List indexes space separated.
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
            valid_values: Either of proxy / fastcgi / websocket / uwsgi / static /
              custom
          uri:
            description: Any string / regex that nginx understand as a `location`
            required: true
            type: string
            valid_values: Any string including regex
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
        type: object
      upstreams:
        description: list of upstream objects
        object_id: upstream
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
        required: false
        type: array
      webroot:
        description: Subfolder to serve data from based on the root /var/www/_vhost_id_
        required: false
        type: string
    required: false
    type: array
  worker_processes:
    default: 4
    description: Number of Nginx processes
    minimum: 1
    required: false
    type: integer
documentation: http://wiki.nginx.org/Modules
tags:
- web
tasks:
- description: Starts Nginx.
  name: start
- description: Stops Nginx.
  name: stop
- description: Reloads the Nginx configuration and performs a graceful restart.
  name: reload
- description: Restarts Nginx and reload the configuration (this will kill existing
    connections).
  name: restart
- description: Adds a virtual host.
  name: vhost add
  options:
    id:
      description: Adds a virtual host. Use the same attributes as for a vhost in
        the configuration.
      required: true
      type: object
- description: Removes a vhost and restarts Nginx if needed. If `purge` is set to
    true, removes the associate webroot.
  name: vhost remove
  options:
    id:
      description: The ID of your nginx domain
      required: true
      type: string
    purge:
      default: false
      description: Whether or not delete the associated webroot (/var/www/{vhost_id})
      required: false
      type: boolean
title: Nginx

---
Nginx is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a Web server.

## Examples

* ### PHP app

  ```example
  configuration:
    nginx:
      vhosts:
        - id: my_vhost_php
          domain: mydomain.com
          indexes: index.php
          routes:
            - uri: '~ \.php$'
              type: fastcgi
              to: localhost:9001
  ```

  We here define a vhost that will answer to the `mydomain.com` domain and will pass all requests which URL ends up with `.php` to a `fastcgi` process listening on `http://localhost:9001` (Typically a php-fpm process).

  This configuration will generate the following Nginx configuration file (also linked and enabled in `sites-enabled`):

  #### /etc/nginx/sites-available/my_vhost_php

  ```snippet
  server {
      listen   80;
      root /var/www/my_vhost_php;

      index index.php index.html index.htm;

      access_log /var/log/nginx/my_vhost_php-access.log;
      error_log /var/log/nginx/my_vhost_php-error.log;

      # Make site accessible from http://localhost/
      # server_name _;
      server_name mydomain.com;

      location ~ \.php$ {
          # Route type: fastcgi
          fastcgi_pass localhost:9001;
          fastcgi_split_path_info ^(.+\.php)(/.+)$;
          # NOTE: You should have "cgi.fix_pathinfo = 0;" in php.ini
          fastcgi_index index.php; 
          include fastcgi_params;
      }
  }
  ```

* ### Node.js app

  ```example
  configuration:
    nginx:
      vhosts:
        - id: my_vhost_node
          domain: mydomain.com
          routes:
            - uri: '/'
              type: proxy
              to: localhost:3000
  ```

  We here define a vhost that will answer to the `mydomain.com` domain and will proxy all requests to a http process listening on `http://localhost:3000` (Typically your Node.js service).

  #### /etc/nginx/sites-available/my_vhost_node

  ```snippet
  server {
      listen   80;
      root /var/www/my_vhost_node;

      index index.html index.htm;

      access_log /var/log/nginx/my_vhost_node-access.log;
      error_log /var/log/nginx/my_vhost_node-error.log;

      # Make site accessible from http://localhost/
      # server_name _;
      server_name mydomain.com;

      location / {
          # Route type: proxy
          proxy_pass localhost:3000;
          proxy_pass_header Set-Cookie;
      }
  }
  ```

## vhosts

Save for a few settings, you'll most likely end up adding vhosts to your Nginx configuration.

In a nutshell, each vhost defines a directory of files, where your application or Web site resides, and a list of domains associated with it. Whenever you add a vhost, we'll create a Web root associated with its id: `var/www/{vhost_id}` where `{vhost_id}` is the id of your vhost.

<em>You can use the `webroot` if you're serving files out of a sub-folder of the default Web root. For example, if you serve files out of the `public/` subfolder of your app, adding the `webroot: public` to your vhost will make it serve files out of the `/var/www/my_vhost/public` folder.</em>

## Routes

Routes allow you to define a list of ways to handle different types of requests, based on the `uri` (order matter, first routes in the list have precedence). These routes have a `type` attribute:

- `custom` (default): routes of this type have a `custom` attribute that will take the content of a regular [Nginx location block](http://nginx.org/en/docs/http/ngx_http_core_module.html#location).
- `fastcgi`: sends requests to a fastcgi backend or upstream. Common for **PHP apps**.
- `proxy`: sends requests to a http proxy (local or remote). Common for **node.js apps**.
- `websocket`: assumes requests are handled as websocket traffic.
- `uwsgi`: sends requests to a uwsgi service. Common for **Python apps**.
- `static`: serves files as static assets without any processing.

<em><strong>You can add supported technologies with the `support` attribute</strong>. This attribute willl help your vhost figure out what index to serve. By default it includes `index.html` and `index.html`, adding `php` to `support` will extend it to `index.php`.</em>
