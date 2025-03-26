## Summary



## Diagram





## VPC peering

2 VPCs can be peered if they have no overlapping cidr range.

paired VPC can access resources in another VPC, security group must also be configured.


## EC2 Instance Connect Endpoint

EICE is a subnet-level resource that can be used connect to instances in the subnet, even if subnet is private. It is listed under VPC endpoint but it has the eice- id prefix.

There is [quota](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/eice-quotas.html) for EICE, 1 per VPC, 5 per region.

## VPC transit gateway


## Instance Profile

Instance Profile is effectively an IAM role only for ec2 instances.

## Notes

When you use DNS related CLI on an internal ip address, it will go to lookup a private DNS server, which is on one of the reserved private address.
```sh
> hostname
ip-192-168-1-5.ap-northeast-1.compute.internal
> dig $(hostname)
;; SERVER: 192.168.1.2#53(192.168.1.2) (UDP)
> nslookup $(hostname)
Server:         192.168.1.2
Address:        192.168.1.2#53
```
