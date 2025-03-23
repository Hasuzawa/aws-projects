## Summary

Document DB features
- security group
- cluster & instance (up to 15)
- logging
- backup & snapshot

port: 1150 - 65535


## DB intance

Creating a db instance could take up to 5 minutes

one instance would be the primary instance and others would be replica.
promotion tier can be set up to determine which instance would be preferred as primary instance.

## Regional & Global cluster

global cluster has one primary region and up to 5 read-only secondary regions.

Some instance is not supported by global cluster, which will block migration from regional to global cluster

## Subnet Group

The subnets where the db instance would be in, the subnets must belong to a single VPC.

## Parameter Group

Some parameters for log, profiler, tls
