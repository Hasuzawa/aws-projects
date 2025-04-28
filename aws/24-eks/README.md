## Summary

Elastic Kubernetes Service (EKS) is a managed service for running kubernetes cluster on AWS.

```
Cluster --> Note Group -->
```

Both cluster and node needs a role.

Unlike self-hosted Kubernetes, the control plane is in AWS-managed vpc and is not visible to users.

## Cluster

features
- scaling & update behavior
- restrict placement of service, node, pod by cidr
- zonal shift (done by ARC, HA at AZ level by failover to another AZ in same region)
- runs on Outposts

## Node




## Cost

Cluster has a cost, even if no service is running inside. Standard support which lasts for about one year costs much less than extended support.
