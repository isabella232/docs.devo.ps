---
tasks:
- description: Clone or update a git repository
  name: git_clone
  options:
    git_repo_address:
      description: URL of the git repository (http or ssh)
      required: true
      type: string
    git_repo_dest:
      description: Folder where repository is cloned on the node
      required: true
      type: string
    git_repo_version:
      default: HEAD
      description: Version of the repository to checkout (HEAD, SHA-1, branch or tag
        name)
      required: false
      type: string
title: Common

---
