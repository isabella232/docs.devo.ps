---
title: Events
---

Events are signals emitted a certain time during the lifetime of your infrastucture. They can be listened upon and used to build workflows and chains of actions.

## Using events in tasks

Refer to the [event section in tasks](/manual/tasks/#event)

## Signal list

### Nodes

- `node.{my-node}.create.start`; is emitted on start of the creation of a node. If the node previously failed at being created, it will re-emit this event at the next attempt.
- `node.{my-node}.create.success`; is emitted on successful completion of the creation. This event is usually emitted only once in the life-time of a server.
- `node.{my-node}.create.error`; is emitted everytime the creation process fails.
- `node.{my-node}.create`; is a short version of `.success`.

- `node.{my-node}.update.start`; is emitted everytime the node starts to be updated. It occurs when a new service gets added, removed, configuration gets updated, collaborators gets added / removed, etc.
- `node.{my-node}.update.success`; is emitted on successful completion of an update.
- `node.{my-node}.update.error`; is emitted on error while updating a node.
- `node.{my-node}.update`; alias of `.success`

*In the examples above, {my-node} is the `id` of the node*

### Tasks

- `task.{my-task}.run.start`; is emitted every time a task starts its execution.
- `task.{my-task}.run.success`; is emitted on successful completion of a task run.
- `task.{my-task}.run.error`; is emitted everytime the task fails.
- `task.{my-task}.run`; is a short version of `.success`.

*In the examples above, {my-task} is the `id` of the task*
