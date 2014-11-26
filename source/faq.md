---
title: Frequently Asked Questions
---

A quick collection of Frequently Asked Questions, if you don't find your answer in the following list feel free to either [contact us](mailto://support@devo.ps), [hop in a chat](http://www.hipchat.com/gyHEHtsXZ) and get in touch.

## How do I access my server?

Simply use `ssh` and access it with the following command:

```
ssh devops@{ip.add.re.ss}
```

Where `{ip.add.re.ss}` is the IP address of your server. You can find this information on the details of your server at `https://app.devo.ps/{USER}/{REPO}/node/{NODE_ID}`

## How do I remove / delete a server?

- Go in your repository page (e.g. `https://app.devo.ps/{USER}/{REPO}`),
- Click on your server, then on the `Edit` icon,
- Click on `Remove` at the bottom of the edit form, next to the `Save` button.

If you are using `git` directly, you can simply remove the `.yml` file, commit and push back to your devo.ps repository.

## How long does it take to deploy / sync a server?

It obviously depends how many services you have enabled on your box, whether you are creating the server for the first time or only updating it, which cloud provider you are using (some are faster), and where you install the services from (the network speed might differ, mirrors might be closer).

Without being fully accurate; you can estimate the breakdown to:

- Provision a new server; ~ 2/3 minutes
- Install base services, users, etc.; ~ 2/3 minutes
- Install custom services; ~ 2/3 minutes per service

Usually it will take from 5 to 15 min for a new box to be created and synced.

When updating a server and adding / updating services, it should only take a few minutes.

Do not take those numbers for granted though; check the console of your server at `https://app.devo.ps/#/{USER}/{REPO}/node/{NODE_ID}/console` to see the progress.

## I can't connect to my server?

Check that you are using the correct SSH private key, and that you are using the `devops` user.

## I can't clone/pull/push to my devo.ps Git repository?

Check that you are using the correct SSH private key.

## I changed the provider's details (either provider, size or location) but nothing happens?

We currently do not support resize, or migration of servers between providers or regions. 

If you want to change you can either:

- Remove your server and create a new one with the new provider details.
- Create a new server directly with a different file name.
- Perform a manual resize on the cloud provider of your choice; as long as the data are present and the IP address remain the same you will still be able to manage your server via devo.ps.

## I started a task but it gets stuck while updating/cloning my GitHub repository?

If you use a **public GitHub repository**, make sure that:

- You use the `HTTP` url to the repository (e.g. `https://github.com/user/myrepo.git`)

If you use a **private GitHub repository**, make sure that:

- You use the `SSH` based URL (e.g. `git@github.com/user/myrepo.git`)
- You have added the SSH key of your server to your GitHub account, either as a deploy key to the repository, or directly to your user.

## I started to sync a server / run a task but it never completes / keep on spinning?

[Contact us.](mailto://support@devo.ps)

## How do I give access to a buddy of mine?

Use the collaboration feature! Simply follow the steps below:

- Get your buddy to sign-up, 
- Add his username to the list of collaborators for your repository. 

He/She will be able to view/edit your servers and tasks and will also be able to access your boxes. Remove him from your collaborator list and all his accesses will be revoked from your infrastructure.

## Do you support XYZ?

Check the services documentation (on the left). If we don't, feel free to [contact us](mailto://support@devo.ps) and let us know that you are interested in such technology.

## How much does it cost?

It depends on your usage of the platform. Check the [pricing page](http://devo.ps/pricing/) for more details. Currently this is still free for all!

## How do I do ...

[Hop on a chat](https://www.hipchat.com/gyHEHtsXZ) with us and we'll make sure to answer as effeciently as we can. Or [drop us a line](mailto://support@devo.ps) in Intercom.

## I have a great idea.

We're always open to suggestions. Feel free to [tell us](mailto://support@devo.ps)!

## I love you!

So do we!

