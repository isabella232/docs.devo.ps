---
configuration:
  cipher:
    default: BF-CBC
    description: cipher
    enum:
    - BF-CBC
    - AES-128-CBC
    - DES-EDE3-CBC
    required: false
    type: string
  dev:
    default: tun
    description: Device type
    enum:
    - tun
    - tap
    required: false
    type: string
  dns1:
    default: 208.67.222.222
    description: DNS to propagate to the clients (default to OpenDNS)
    required: false
    type: string
  dns2:
    default: 208.67.220.220
    description: DNS to propagate to the clients (default to OpenDNS)
    required: false
    type: string
  group:
    default: nogroup
    description: Running group of openvpn (must exist)
    required: false
    type: string
  key:
    ca_expire:
      default: 3650
      description: CA validity period (in days)
      required: false
      type: integer
    city:
      default: SanFrancisco
      description: Key city
      required: false
      type: string
    common_name:
      default: server
      description: Key Common Name (CN)
      required: false
      type: string
    country:
      default: US
      description: Key country
      required: false
      type: string
    email:
      default: admin@server
      description: Key email
      required: false
      type: string
    key_expire:
      default: 3650
      description: Key validity period (in days)
      required: false
      type: integer
    key_size:
      default: 1024
      description: Increase key size if you are paranoid; it will slow down TLS negociation
      required: false
      type: integer
    name:
      default: server
      description: Key name
      required: false
      type: string
    org:
      default: Fort-Funston
      description: Key Organization
      required: false
      type: string
    org_unit:
      default: server
      description: Key Organization Unit (OU)
      required: false
      type: string
    province:
      default: CA
      description: Key province
      required: false
      type: string
  max_client:
    default: 100
    description: Maximum number of simultaneous clients
    required: false
    type: integer
  netmask:
    default: 255.255.255.0
    description: Netmask to apply on IP range for clients
    required: false
    type: string
  network:
    default: 10.8.0.0
    description: Network IP range for clients
    required: false
    type: string
  port:
    default: 1194
    description: Listening port
    maximum: 65536
    minimum: 1025
    required: false
    type: integer
  proto:
    default: udp
    description: Protocol
    enum:
    - udp
    - tcp
    required: false
    type: string
  user:
    default: nobody
    description: Running user of openvpn (must exist)
    required: false
    type: string
documentation: http://openvpn.net/index.php/open-source/documentation.html
tags:
- app
tasks:
- description: Restart OpenVPN
  name: restart
  options: null
- description: Reload OpenVPN
  name: reload
  options: null
- description: Add OpenVPN client users and send credentials by email
  name: user add
  options:
    users:
      description: list of user objects
      required: true
      type: array
- description: Stop OpenVPN
  name: stop
  options: null
- description: Start OpenVPN
  name: start
  options: null
title: OpenVPN

---

## Tasks
### restart

#### Example in a devops task

    steps:
      - run: devops openvpn restart


### reload

#### Example in a devops task

    steps:
      - run: devops openvpn reload


### user add

#### Example in a devops task

    steps:
      - run: devops openvpn user add
        options:
          users:
            - name: bob
              email: bob@example.com
            - name: alice
              email: alice@example.com



### stop

#### Example in a devops task

    steps:
      - run: devops openvpn stop


### start

#### Example in a devops task

    steps:
      - run: devops openvpn start

