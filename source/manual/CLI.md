---
title: CLI
---

The Command Line Interface (CLI) lets you interact with devo. directly from your terminal. It allows you do everything that you can do through the Web UI: triggering tasks, monitoring the status of a server or listing your repositories.

## Installation

You will need `python 2.7+` as well as `pip` installed on your system.

### MacOS

We recommend MacOS users to use [Homebrew](http://brew.sh/) for installing pip.

    brew install python-pip
    sudo pip install https://app.devo.ps/cli/devops-cli-latest.tar.gz

### Ubuntu / Debian

    sudo apt-get install python-pip
    sudo pip install https://app.devo.ps/cli/devops-cli-latest.tar.gz

### CentOS / Fedora / RH

You will first need to install EPEL (you can find plenty of tutorials for [Fedora](http://fedoraproject.org/wiki/EPEL/FAQ#howtouse) or [CentOS & RH](http://www.rackspace.com/knowledge_center/article/installing-rhel-epel-repo-on-centos-5x-or-6x))

    sudo pip install https://app.devo.ps/cli/devops-cli-latest.tar.gz

*The CLI isn't currently tested or optimized on the Windows platform.*

## Usage

<dl>
  <dt><code class='terminal'>devops --help</code></dt>
  <dd>Displays the full list of commands supported by the CLI.</dd>

  <dt><code class='terminal'>devops login</code></dt>
  <dd>Authenticate your CLI; this require you use the API key given to you on the [user settings page](https://app.devo.ps/#/user/settings).</dd>

  <dt><code class='terminal'>devops logout</code></dt>
  <dd>Logs your CLI out.</dd>

  <dt><code class='terminal'>devops list repos</code></dt>
  <dd>Return the list of all the repositories you have access to (as displayed in your profile).</dd>

  <dt><code class='terminal'>devops list [--repo={REPO}] nodes</code></dt>
  <dd>Return the list of all the nodes in the specified repository (`{REPO}`). <small>If the `--repo` option is ommitted, assumes the repo is the one you run the command from (requires a local clone of the repository).</small>
  </dd>

  <dt><code class='terminal'>devops list [--repo={REPO}] tasks</code></dt>
  <dd>Return the list of all the tasks associated with the specified repository (`{REPO}`). <small>If the `--repo` option is ommitted, assumes the repo is the one you run the command from (requires a local clone of the repository).</small>
  </dd>

  <dt><code class='terminal'>devops list [--repo={REPO}] runs {TASK} [--count={COUNT}]</code></dt>
  <dd>Returns the list of the previous runs of a task specified by `{TASK}`, limiting the list size to `{COUNT}` runs. <small>If the `--repo` option is ommitted, assumes the repo is the one you run the command from (requires a local clone of the repository). If the `--count` option is ommitted, will fetch the last 10 runs by default.</small>
  </dd>

  <dt><code class='terminal'>devops list [--repo={REPO}] webhooks</code></dt>
  <dd>Return the list of all the webhooks associated with tasks from the specified repository (`{REPO}`). <small>If the `--repo` option is ommitted, assumes the repo is the one you run the command from (requires a local clone of the repository).</small>
  </dd>

  <dt><code class='terminal'>devops sync [--repo={REPO}] {NODE}</code></dt>
  <dd>Trigger the syncing of the specified node (where `{NODE}` is the node id). This is useful in case a node fell out of sync (see [nodes status](/manual/nodes/#status)). <small>If the `--repo` option is ommitted, assumes the repo is the one you run the command from (requires a local clone of the repository).</small>
  </dd>

  <dt><code class='terminal'>devops info [--repo={REPO}] {NODE}</code></dt>
  <dd>Return information (IP address, status, services and public SSH keys) about the specified node (where '{NODE}' is the node id). <small>If the `--repo` option is ommitted, assumes the repo is the one you run the command from (requires a local clone of the repository).</small>
  </dd>

  <dt><code class='terminal'>devops link [--repo={REPO}] {NODE}</code></dt>
  <dd>Link the node (where `{NODE}` is the node id) to devo.ps with the information provided interactively. <small>If the `--repo` option is ommitted, assumes the repo is the one you run the command from (requires a local clone of the repository). Note: the node file must be already exist in devo.ps.</small>
  </dd>

  <dt><code class='terminal'>devops run [--repo={REPO}] {TASK}</code></dt>
  <dd>Triggers the designated task (where `{TASK}` is the task id). <small>If the `--repo` option is ommitted, assumes the repo is the one you run the command from (requires a local clone of the repository).</small>
  </dd>

  <dt><code class='terminal'>devops logs [--repo={REPO}] --node={NODE}</code></dt>
  <dd>Returns the logs of the latest sync. <small>If the `--repo` option is ommitted, assumes the repo is the one you run the command from (requires a local clone of the repository).</small>
  </dd>

  <dt><code class='terminal'>devops logs [--repo={REPO}] --task={TASK} [{RUN}]</code></dt>
  <dd>Returns the logs of the run specified by the run id `{RUN}` for the task which id is `{TASK}`. <small>If the `--repo` option is ommitted, assumes the repo is the one you run the command from (requires a local clone of the repository). If `{RUN}` is ommitted, fetches the logs of the latest run.</small>
  </dd>

  <dt><code class='terminal'>devops ssh [--repo={REPO}] [{NODE}]</code></dt>
  <dd>Establish an SSH connection with the designated node (where {NODE} is the node id). <small>If the `--repo` option is ommitted, assumes the repo is the one you run the command from (requires a local clone of the repository). If `{NODE}` is ommitted and the repository only contains 1 node, connects to this node.</small>
  </dd>

  <dt><code class='terminal'>devops ssh-config [--repo={REPO}] [{NODE}]</code></dt>
  <dd>Show the SSH connection configuration used to connect to the designated node (where `{NODE}` is the node id). <small>If the `--repo` option is ommitted, assumes the repo is the one you run the command from (requires a local clone of the repository). If `{NODE}` is ommitted, returns the ssh-config of all the nodes defined in the repository.</small>
  </dd>

</dl>