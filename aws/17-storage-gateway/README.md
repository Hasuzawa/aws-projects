## Summary

Storage gateway is interface between an on-premise network and AWS cloud. It support a few different storage type and protocol.

## File Gateway

```
client <---( NFS / SMB )---> storage gateway  <------> S3 bucket
```

If you use the web console to configure it, by default the instance will have a 150GB /dev/sdb as cache block

When hosted on ec2, you can stop the instance to turn off the storage gateway and resume later.

## Volume Gateway

```
client <---( iSCSI )---> volume gateway <------> S3 bucket
```

types
- cached volume
  - data stored in AWS cloud, frequently accessed data cached at gateway.
- stored volume
  - data stored at client, asynchronous back-up to S3 via gateway.
  - does not support ec2 instance hosting.

## Tap Gateway

```
client <---( iSCSI )---> tape gateway <------> S3 bucket
```

There are two default tape pool to store tapes
- deep archive
- flexible glacier

the pools can have retention policy and retention day
- governance (restricted)
- compliance (cannot be bypassed by anyone)

## Hosting

the gateway can be hosted with virtualization, ec2 instance, or a physical hardware.

## Cost

Most of the time, data transfer into AWS cloud incur no cost, but data ingress by storage gateway **will** incur a cost.

## Further

volume can only be increased, not decrased after creation.

instance can has public ip address, even if they are placed in private subnet or vpc with no internet gateway. but without these, they cannot connect to or from internet.
