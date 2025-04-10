## Summary

EFS is a network file system on AWS Cloud. It is bound to a VPC so it is a regional service.

## Placement

- regional
- One Zone (only one AZ)

## Performance & Throughput

Performance mode of an EFS is how it handles workload.
Throughput mode how EFS manage capacity for read and write.

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
