---
configuration:
  gems:
    default: []
    description: List of gems to install globally on the system
    required: false
    type: array
  versions:
    default: {}
    description: 'Dictionary of Ruby versions to install in addition to the system
      version of Ruby. The `keys` are the Ruby versions to install, the `values` are
      either an empty object `{}` to only install the Ruby version without extra gems,
      or an object with a `gems` attribute that lists the gems to install (e.g. `{
      gems: [rails, compass] }`)'
    required: false
    type: object
documentation: https://www.ruby-lang.org/en/documentation/
experimental: true
tags:
- language
tasks:
- description: Add Ruby gems globally
  name: gems add
  options:
    gems:
      description: List of gems (string) to add.
      required: true
      type: array
    ruby_version:
      default: system
      description: 'Version of Ruby the gems should be installed to. Note: the version
        of Ruby should be installed on the system already.'
      required: false
      type: string
- description: Remove Ruby gems globally
  name: gems remove
  options:
    gems:
      description: List of gems (string) to remove
      required: true
      type: array
    ruby_version:
      default: system
      description: 'Version of Ruby the gem should be removed from. Note: the version
        of Ruby should be installed on the system.'
      required: false
      type: string
- description: List installed versions of Ruby in rbenv
  name: versions list
- description: List available versions of Ruby (installable in rbenv)
  name: versions list available
- description: Add versions of Ruby (need to be installable)
  name: versions add
  options:
    versions:
      description: List of Ruby versions to install.
      required: true
      type: array
- description: Remove versions of Ruby (available in rbenv)
  name: versions remove
  options:
    versions:
      description: List of Ruby versions to install.
      required: true
      type: array
title: Ruby

---
Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.

Multiple versions of Ruby (and gems) can be installed with [rbenv](https://github.com/sstephenson/rbenv#groom-your-apps-ruby-environment-with-rbenv). The various versions are globally available in `/opt/rbenv`.


## Examples

* ### System only

  ```example
  services:
    ruby: '*'

  configuration:
    ruby:
      gems:
        - rails
        - compass
  ```

  We are installing here the default version of Ruby available on the system via the package manager (apt), and install globally the gems `rails` and `compass`

* ### Single custom Ruby version

  ```example
  services:
    ruby: '*'

  configuration:
    ruby:
      versions:
        1.9.3-p551: {}
      gems:
        - compass
  ```

  We are installing here both the default version of Ruby available on the system via the package manager (apt), and the version `1.9.3-p551`. We install as well `compass` using the **system version** of Ruby, but install no extra gems with the `1.9.3-p551` version.

* ### Multiple custom Ruby versions and gems

  ```example
  services:
    ruby: '*'

  configuration:
    ruby:
      versions:
        1.9.3-p551:
          gems:
            - rails
        2.0.0-p598:
          gems:
            - rails
  ```

  We are installing here the default version of Ruby available on the system via the package manager (apt), as well as 2 extra versions of Ruby (`1.9.3-p551` and `2.0.0-p598`). No gems are installed for the system version of Ruby, but `rails` is installed for both extra versions of Ruby.

## Plugins of rbenv

The following rbenv plugins are installed to ease the overall experience:
- [ruby-build](https://github.com/sstephenson/ruby-build#readme): is used to build the requested versions of Ruby

Since the Ruby versions are built from source, the sync operation may take longer than expected and depends on the computing power of the your server.