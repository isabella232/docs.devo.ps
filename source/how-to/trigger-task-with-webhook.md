---
title: Trigger a Task With a Webhook
---

Webhooks provide a highly convenient way to execute a task automatically when a specific URL gets hit. Common use cases are:

- Deploy an application whenever a commit is performed in your Github code repository
- Run integration testing on each commit
- etc.


In this how-to we will focus on setting up a webhook in a devo.ps task and associate it with GitHub.


1. (Pre-requisite) You need to have defined a task with the steps you want to run automatically.

1. From your profile page, **click on the repository you want to use**. You will land on the "Home" section of the repository.

    <p align='center'><img src='/images/how-to/wh-select-repo.png' alt='Select devo.ps repository' style='max-width:690px;'/></p>

    <em>The Home section shows all the servers and tasks you have defined in that specific repository and their status.</em>

1. **Click on the task** you want to trigger via a GitHub webhook, and **click on the edit icon**.

    <p align='center'><img src='/images/how-to/wh-task-details-edit.png' alt='Edit the devo.ps task' style='max-width:690px;' /></p>

1. In the editor, edit your task and add a new webhook trigger like the following:

        id: my-task
        name: My Task
        type: task

        triggers:
          webhooks:
            # This URL is publicly accessible, you may want to randomize it instead
            # - path: SuPeRr4ndOm
            - path: my/super/secret/url

        steps:
          ...

    <p align='center'><img src='/images/how-to/wh-task-details-url.png' alt='URL of the webhook' style='max-width:690px;' /></p>

    <em>The path you enter in your task will be reachable via the following URL: https://wh.devo.ps/<i>username</i>/<i>repo</i>/<i>path</i>. You will see the exact URL path when you save the task and see the details of the task.</em>

    <em>You can specify **multiple paths** for the various clients you may want to use; for example a GitHub dedicated URL, a Jenkins URL, etc.</em>

    <em>This task will be triggered by a POST HTTP request on the URL previously defined.</em>

1. **Go in your GitHub account**, and select the repository you want to set the webhook on.

    <p align='center'><img src='/images/how-to/wh-gh-select-repo.png' alt='Select Github Repository' style='max-width:690px;' /></p>

1. **Click on the settings page**, then **Webhooks and Services** tabs.

    <p align='center'><img src='/images/how-to/wh-gh-settings.png' alt='Select Repository Settings' style='max-width:690px;' /></p>

    <em>Note; you need to be administrator of that GitHub repository to access the settings page. If you are not, you may want to contact the admins and get them to add the webhook.</em>

1. **Click on "Add webhook"**, and **paste** the webhook URL in the "Payload URL" text box. Keep the "Content type" as <code>application/json</code> and leave the "Secret" blank. You probably want to keep the rest as default, unless you know what you are doing; only trigger the webhook on "push event".

    <p align='center'><img src='/images/how-to/wh-gh-add.png' alt='Add Webhook on GitHub' style='max-width:690px;' /></p>
    <p align='center'><img src='/images/how-to/wh-gh-create.png' alt='Fill Webhook details on GitHub' style='max-width:690px;' /></p>

    <em>You may be prompted for your GitHub password to perform this operation.</em>

    <em>You can also refer to the official [GitHub documentation about webhook](https://developer.github.com/webhooks/).</em>

1. Finally **Click the "Add Webhook" button** and you are set! 

Any future commit on your GitHub repository will automatically trigger a webhook to your devo.ps account and get the task to start in a matter of seconds.
