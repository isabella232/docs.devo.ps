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
    description: List of virtual hosts objects
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
- description: Start Nginx if stopped
  name: start
- description: Stop Nginx if started
  name: stop
- description: Reload Nginx, reload the configuration and perform a graceful restart
  name: reload
- description: Restart Nginx, reload the configuration (but kills existing connection)
  name: restart
- description: Defines a HTTP virtual host in Nginx config
  name: vhost add
  options:
    aliases:
      description: Space separated list of domain name aliases
      required: false
      type: string
    domain:
      description: Domain name
      required: true
      type: string
    port:
      default: 80
      description: Listening port (TCP/80 by default, TCP/443 if SSL is enabled)
      required: false
      type: integer
    routes:
      description: list of route objects
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
          description: The type of handler for that route
          required: true
          type: string
          valid_values: Either of proxy / fastcgi / websocket / uwsgi / static
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
    upstreams:
      description: list of upstream objects
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
      description: subfolder to serve data from based on the root /var/www/_domain_
      required: false
      type: string
title: Nginx

---
