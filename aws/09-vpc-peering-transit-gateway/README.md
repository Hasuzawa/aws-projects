## Summary

Create 3 VPCs and pair them with transit gateway.

## Diagram





## VPC peering

2 VPCs can be peered if they have no overlapping cidr range.

once paired, and with following config, the VPCs can access resources in both of them.
- security group allow inbound access from another VPC
  - by cidr range
  - by security group of another VPC
- route table
  - the transit gateway connection

To be more clear, if A and B are peered, and A wants to access B, then
- route table of A must route cidr to gateway connection
- security group of B must allow ingress from A

The access can be one-sided, partial or asymmetric.

## Route Table

the local route that resolve the address within the VPC is always present.

## EC2 Instance Connect Endpoint

EICE is a subnet-level resource that can be used connect to instances in the subnet, even if subnet is private. It is listed under VPC endpoint but it has the eice- id prefix.

There is [quota](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/eice-quotas.html) for EICE, 1 per VPC, 5 per region.

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
