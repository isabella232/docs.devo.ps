---
title: Git
---

### Nodes operations

On push - File validation

On git push, the file will be parsed and validated by the devops platform. If the file is not valid, the push will be rejected. You will need to fix the file before pushing again.

File creation

On commit / push of a new node on git, the node will be provisioned on the provider defined in the file.

It will use the cloud provider API credentials defined in your profile. Obviously any attempt to create a node on an invalid provider or on a provider for which no credentials are found in the profile will fail.

File delete

Removing a node from the repository is interpreted by devops as a request to effectively remove the server. The server will be stopped and destroyed.

File update

Adding or removing a service, updating the configuration of a service will lead to a sync of the node. After a few minutes the node will have the services and configuration as described in the yaml file.