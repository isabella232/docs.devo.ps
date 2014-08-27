---
title: Add a server
---

1. (Optional) Create a new repository.

1. From your profile page, **click on the repository you want to use**. You will land on the "Files" section of the repository.

    <em>Repositories are used to gather logical infrastructures together: set of servers, tasks and scripts that work together.</em>

1. **Navigate to the "Nodes" section**.

1. **Click on the "Add a node" button**. This will open the file editor.

    <em>Servers are often refered to as "nodes"; we use this more general term as we plan on adding support for load balancers, firewall and elements of your infrastructure that are not servers.</em>

1. The editor allows you to **write and save the YAML file that will configure your server**. For the sake of this example, we will create a simple NGINX server on Digital Ocean:

        id: web
        name: Web server
        type: server

        provider:
          name: digitalocean
          region: 3
          size: 66

        services:
          nginx: '*'

    <em>I here assume that I have valid Digital Ocean API keys [set in my profile](/manual/profile/#providers). Moreover, I use the value 3 for `region` and 66 for the `size`, which respectively means the "San Francisco 1" datacenter and the "512M" instance as shown on the [Digital Ocean documentation page](/providers/digitalocean).</em>

1. **Save the file**. You will be directly redirected to the "Nodes" section. Your server will appear and display a "syncing" status.

1. **Once the status of your server is set to "synced", click on it**. You will see your server's details.

1. You can copy the IP address of your server. **Paste this IP in your browser**.

1. **The browser will display the NGINX default message**: "It works!".