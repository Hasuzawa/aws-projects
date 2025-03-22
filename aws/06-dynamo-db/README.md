## Summary

Dyanomo table features
- table class
- index (global secondary index)
- replica
- TTL (time to live)
- point in time recovery (for last 35 days)
- backup

## Replica tables

- replicas cannot be in same region as main table
- table must be either pay-per-request or autoscaled in capacity
- requires streaming to be enabled for table
- changes to any one table propogate to other tables

e.g. you might have a few replica tables with arn like these
```
arn:aws:dynamodb:eu-central-1:xxx:table/y
arn:aws:dynamodb:us-west-1:xxx:table/y
arn:aws:dynamodb:ap-northeast-1:xxx:table/y
```

## Global table

global tables allow multiple tables with same name in different region.
updates to one table propogate to other tables.

## DAX

DAX (Dynamo Accelerator) is a managed caching layer.
- cluster for distributed query
- replication across subnets
- parameter group to control eviction period of item and query
