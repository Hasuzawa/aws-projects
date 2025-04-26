## Summary

ECS Fargate is managed service for containers.


```
Cluster --(contain)--> Service --(use)--> Task --(spawn)--> container
```

## Details

If you launch by ec2 instance, autoscaling would be done on instance level with ASG.
If you use fargate, it is done at service level with capacity provider.

## Cluster

A ECS cluster is a group of coordinated containers.

## Capacity Provider

Task can declare capacity mode it can run on, and cluster can run task using supported capacity provider.

capacity providers
- ec2 instance
- fargate
- on-premise

## Task

A ECS task is a template for container deployment.

some important parameter
- task vcpu & memory
- container vcpu & memory
- architecture & OS
- storage & volume
- port mappings
- network mode

The network mode needs a bit more words.
- awsvpc
  - the container would be placed in a vpc and subnet, and will have private ip address, security group
- bridge
  - use Docker bridge as the network to connect containers
- default
- host
  - bypass virtualization
- none
  - no external network connectivity

The choice lies in how much control AWS is to have over the network, which matters when the infra is migrating into or away from AWS.

Fargate must use awsvpc network mode, while ec2 instance can choose any modes.

When using awsvpc mode, contains in the same task cannot share ports, i.e. cannot expose port 80 in more than one container, use environment to expose another port or use a LB to direct to different port.

## Further

The name 'Fargate' originates from space shows, and 'Stargate' was already taken.
