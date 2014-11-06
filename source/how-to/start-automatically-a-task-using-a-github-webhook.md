---
title: Start automatically a task using a GitHub webhook
---

Webhooks provide a highly convenient way to execute a task automatically when a specific URL gets hit. Common use cases are:

- deploy an application whenever a commit is performed in your Github code repository


1. (Pre-requisite) You need to have defined a task with the steps you want to run automatically

1. From your profile page, **click on the repository you want to use**. You will land on the "Home" section of the repository.

    <em>The Home section shows all the servers and tasks you have defined and their status.</em>

1. **Click on the task** to execute automatically via a GitHub webhook, and **click on the edit icon**.

1. In the editor, edit your task and add a new webhook trigger like the following:

        id: my-task
        name: My Task
        type: task

        triggers:
          webhooks:
            - path: my/secret/url

        steps:
          ...

    <em>The path you enter in your task will be reachable via the following URL: https://wh.devo.ps/*{ username }*/*{ repo }*/*{ path }*. You will see the exact URL path when you save the task and see the details of the task.</em>

    <em>You can specify multiple paths for the various clients you may want to use; for example a GitHub dedicated URL, a Jenkins URL, etc.</em>

    <em>You can automatically trigger this task by performing a POST HTTP request.</em>

1. **Go in your GitHub account**, and select the repository you want to set the webhook on.

1. **Click on the settings page**, then **Webhooks and Services** tabs.

    <em>Note; you need to be administrator of that GitHub repository to access the settings page. If you are not, you may want to contact the admins and get them to add the webhook.</em>

1. **Click on "Add webhook"**, and **paste** the webhook URL in the "Payload URL" text box. Keep the "Content type" as *application/json* and leave the "Secret" blank. You probably want to keep the rest as default, unless you know what you are doing; only trigger the webhook on *push event*.

    <em>You may be prompted for your GitHub password to perform this operation.</em>

    <em>You can also refer to the official [GitHub documentation about webhook](https://developer.github.com/webhooks/).</em>

1. Finally **Click the "Add Webhook" button** and you are set! Any future commit on your GitHub repository will automatically trigger a webhook to your devo.ps account and get the task to start in a matter of seconds.
