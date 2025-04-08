## Summary

Storage gateway is interface between an on-premise network and AWS cloud. It support a few different storage type and protocol.

## File Gateway

```
client <---( NFS / SMB )--> storage gateway  <--------> S3 bucket
```

If you use the web console to configure it, by default the instance will have a 150GB /dev/sdb as cache block

When hosted on ec2, you can stop the instance to turn off the storage gateway and resume later.


## Volume Gateway



## Tap Gateway




## Hosting

the gateway can be hosted with virtualization, ec2 instance, or a physical hardware.

## Further

volume can only be increased, not decrased after creation.

instance can has public ip address, even if they are placed in private subnet or vpc with no internet gateway. but without these, they cannot connect to or from internet.
