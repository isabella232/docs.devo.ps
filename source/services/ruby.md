---
configuration:
  gems:
    default: []
    description: List of gems to install globally on the system
    required: false
    type: array
documentation: https://www.ruby-lang.org/en/documentation/
tags:
- language
title: Ruby

---

## Example

    services:
      ruby: '*'
    configuration:
      ruby:
        gems:
          - compass

Add ruby support to allow install of Gem packages (globally) on the system.
## Tasks
### add gems
# Add Ruby gems

Install ruby gems globally on the server.

### remove gems
# Remove Ruby gems

Remove Ruby gems installed globally from the server. If the gems are not installed it doesn't do anything.
