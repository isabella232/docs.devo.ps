---
configuration:
  ignoreip:
    description: Space separated list of IP addresses, CIDR masks or DNS hosts for
      which Fail2ban will never block connection attempts.
    required: false
    type: string
tags:
- security
tasks:
- description: Start Fail2ban if stopped
  name: start
- description: Stop Fail2ban if started
  name: stop
- description: Reload Fail2ban, reload the configuration and perform a graceful restart
  name: reload
- description: Restart Fail2ban, reload the configuration (but kills existing connection)
  name: restart
- description: Ban an IP address to a service (known to fail2ban)
  name: ip ban
  options:
    ip:
      description: IP address of the host to ban
      required: true
      type: string
    jail:
      default: ssh
      description: The service to ban the IP address from
      required: false
      type: string
- description: Lift a ban from an IP address to a service (known to fail2ban)
  name: ip unban
  options:
    ip:
      description: IP address of the host to unban
      required: true
      type: string
    jail:
      default: ssh
      description: The service to unban the IP address from
      required: false
      type: string
title: Fail2ban

---
Fail2Ban is a service that automatically blocks failed connection attempts to services running on a node. The remote IP addresses are then usually blacklisted for up to 10 minutes before being allowed again.