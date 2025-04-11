## Summary

EFS is a network file system on AWS Cloud. It is bound to a VPC so it is a regional service.

It supports tiered storage, similar to S3 bucket.

## Placement

- regional
- one zone (only one AZ)

## Performance & Throughput

Performance mode of an EFS is how it handles workload.
Throughput mode how EFS scales capacity for read and write.

performance mode
- general (recommended)
- maxIO

throughput mode
- enhanced
  - elastic
  - provisioned
- burst (scale with storage)

some combination of throughput and performance mode is not allowed

| -       | elastic | provisioned | burst |
|---------|---------|-------------|-------|
| general | ✅       | ✅           | ✅     |
| maxIO   | ❌       | ✅           | ✅     |

## Lifecycle (storage class transition)

- IA
- archive

accessed files can be put back to standard.

## Replication

sync an EFS with content of another EFS, the destination must have replication protection turned off.
Replicated filesystem becomes read-only and get files from source.

## Access Point

access point can be used to restrict or move access of an EFS to a subdirectory.
