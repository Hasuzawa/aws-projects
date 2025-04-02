## Summary

Instance in public subnet & private subnet. Instance in private subnet can only access internet if route table direct it to a public NAT gateway (which is necessarily in public subnet).

## Route Table

route table is an address book in a vpc. It tells resources where to find other resources. DNS translate between IP address and DNS, while route table links IP address with resources.

## NAT gateway

NAT gateway allows resources in other subnet to access resources reachable in this subnet. Effectively, it allows other resources to use the route table on the subnet.

One of the main usage is to allow instances in private subnet to access internet.

Note that NAT gateway does not have security group nor route table attached on it.

public NAT gateway is a gateway placed in public subnet (subnet with route pointing to an internet gateway), so a public IP address is required, this is indicated by its allocation id of elastic IP.

## Elastic IP

Elastic IP can only be created in a vpc with internet gateway. It can be used to give an AWS resource a static public IP address. For HA, you should attach it to load balancer, gateway instead of instances.

## Internet Gateway

One VPC has either one or no internet gateway. Afterall, it is a virtual resource that communicates intent to subscribe to public internet.

This is the only network resource with no bandwidth constraint, and one of few that does not have an address (not even private IP).

## Overview

|                           | VPC    | subnet | route table | NAT gateway      |
|---------------------------|--------|--------|-------------|------------------|
| addressable               | cidr   | cidr   | no          | public / private |
| security group attachment | yes    | yes    | no          | no               |
| AWS network level         | region | AZ     | VPC         | subnet           |

VPC endpoint, private link is another topic.

## Note

NAT gateway **cannot** route private subnet in another VPC (even if peered) to internet.

## Further

The ip route table can actually tell you the subnet, here 192.168.0.0/24 is the subnet this instance is in.
```sh
>>> ip route
default via 192.168.0.1 dev enX0 proto dhcp src 192.168.0.59 metric 512 
192.168.0.0/24 dev enX0 proto kernel scope link src 192.168.0.59 metric 512 
192.168.0.1 dev enX0 proto dhcp scope link src 192.168.0.59 metric 512 
192.168.0.2 dev enX0 proto dhcp scope link src 192.168.0.59 metric 512
```
