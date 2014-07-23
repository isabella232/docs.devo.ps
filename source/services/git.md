---
tags:
- version control
tasks:
- description: Clone or update a git repository
  name: update
  options:
    dest:
      description: Folder where repository is cloned on the node
      required: true
      type: string
    repo:
      description: URL of the git repository (http or ssh)
      required: true
      type: string
    version:
      default: HEAD
      description: Version of the repository to checkout (HEAD, SHA-1, branch or tag
        name)
      required: false
      type: string
- description: Set git user configuration either globally or for a repo defined by
    its path on the system
  name: config
  options:
    email:
      description: Email address of the user used to perform the commits
      required: true
      type: string
    path:
      description: Path of the repo on the host where to set the git configuration,
        if no `path` provided perform a global setup
      required: false
      type: string
    user:
      description: Full name of the user that will perform commits
      required: true
      type: string
- description: Commit and push the content of a folder to a remote repository
  name: deploy
  options:
    branch:
      description: Remote branch to push the source content to (will be removed)
      required: true
      type: string
    repo:
      description: Local folder where the repository is located
      required: true
      type: string
    source:
      description: Source folder within the repo where the content to push is
      required: true
      type: string
title: Git

---
