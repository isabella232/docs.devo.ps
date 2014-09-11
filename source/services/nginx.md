---
tags:
    - web
documentation: http://wiki.nginx.org/Modules

configuration: 
    user:
        default: www-data
        description: Nginx running user.
        type: string
        required: false
    worker_processes:
        default: 4
        description: Number of Nginx processes
        type: integer
        required: false
        minimum: 1
    pid:
        default: /var/run/nginx.pid
        description: Pid file path
        type: string
        required: false
    events:
        worker_connections:
            default: 1024
            description: Number of concurrent http connection handled per nginx process
            type: integer
            required: false
            minimum: 1
    http:
        sendfile:
            default: "on"
            description: Enable sendfile
            type: string
            required: false
        tcp_nopush:
            default: "on"
            description: Enable tcp_nopush
            type: string
            required: false
        tcp_nodelay:
            default: "on"
            description: Enable tcp_nodelay
            type: string
            required: false
        keepalive_timeout:
            default: 65
            description: Keepalive timeout (sec) - 0 to disable
            type: integer
            required: false
            minimum: 0
        types_hash_max_size:
            default: 2048
            description: Maximum size of hash tables
            type: integer
            required: false
            minimum: 0
        access_log:
            default: /var/log/nginx/access.log
            description: Global access log file path
            type: string
            required: false
        error_log:
            default: /var/log/nginx/error.log
            description: Global error log file path
            type: string
            required: false
        gzip:
            default: "on"
            description: Enable gzip compression
            type: string
            required: false
        gzip_disable:
            default: "msie6"
            description: Space separated list of browser to disable gzip compression for
            type: string
            required: false
    vhosts:
        default: []
        description: Array of virtual hosts objects
        required: false
        type: array
        object_id: vhost
        options: 
            id:
                description: Virtual host identifier, used to perform lookup in the vhosts array. Also used to name the configuration files and the default web root.
                required: false
                type: string
            aliases:
                description: Space separated list of domain name aliases
                required: false
                type: string
            domain:
                description: Primary domain name, use '_' as wildcard to respond to every domain / IP
                required: false
                default: _
                type: string
            port:
                description: Listening port (TCP/80 by default, TCP/443 if SSL is enabled)
                required: false
                default: 80
                type: integer
            ssl:
                description: Enable HTTPS
                type: object
                required: false
                options:
                    certificate:
                        description: HTTPS certificate file path (chained if needed)
                        required: false
                        default: /etc/nginx/ssl/{domain}.pem
                        type: string
                    private_key:
                        description: Private key file path used to generate the certificate (password-less)
                        required: false
                        default: /etc/nginx/ssl/{domain}.key
                        type: string          
            routes:
                description: List of route objects. The order matters and the routes will be applied sequentially.
                required: true
                type: array
                object_id: route
                options:
                    uri:
                        description: Any string / regex that nginx understand as a `location`
                        required: true
                        type: string
                        valid_values: Any string including regex
                    type:
                        description: The type of handler for that route
                        required: false
                        type: string
                        default: custom
                        valid_values: Either of proxy / fastcgi / websocket / uwsgi / static / custom
                    to:
                        description: Either an upstream name, or a service / url, or a path
                        required: false
                        type: string
                    custom:
                        description: Custom inline nginx config to include within the route (e.g. auth, custom timeout)
                        required: false
                        type: string
                    static:
                        description: For type static only, define how to consider the source folder - alias or root
                        required: false
                        type: string
                        default: root
                        valid_values: Either of alias / root
            upstreams:
                description: list of upstream objects
                required: false
                type: array
                object_id: upstream
                options:
                    name:
                        description: Name of the upstream - it must be unique on the entire node
                        required: true
                        type: string
                        valid: Unique name on the node
                    backends:
                        description: List of backends associated with the upstream
                        required: true
                        type: array
                        valid: TCP URL and Unix socket path
            webroot:
                description: Subfolder to serve data from based on the root /var/www/_vhost_id_
                required: false
                type: string
            indexes:
                description: List indexes space separated.
                required: false
                type: string
                default: index.html index.htm

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

Nginx is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a Web server.

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
