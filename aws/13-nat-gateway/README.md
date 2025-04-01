## Summary


## Route Table

route table is an address book in a vpc. It tells resources where to find other resources. DNS translate between IP address and DNS, while route table links IP address with resources.

## NAT gateway

NAT gateway routes traffic
One of the main usage is to allow instances in private subnet to access internet.

public NAT gateway is accessible to internet, so a public IP address is required, this is indicated by its allocation id.

## Elastic IP

Elastic IP can only be created in a vpc with internet gateway. It can be used to give an AWS resource a static public IP address. For HA, you should attach it to load balancer, gateway instead of instances.

## Internet Gateway

One VPC has either one or no internet gateway. Afterall, it is a virtual resource that communicates intent to subscribe to public internet.

This is the only network resource with no bandwidth constraint, and one of few that does not have an address (not even private IP).

## Overview

|                           | VPC      | subnet | route table | NAT gateway      | VPC endpoint | private link |
|---------------------------|----------|--------|-------------|------------------|
| addressable               | cidr     | cidr   | no          | public / private | 
| security group attachment | yes      | yes    | no          | yes (eni)        |
| AWS network level         | regional | AZ     | VPC         | subnet           | VPC

## Note

NAT gateway **cannot** route private subnet in another VPC (even if peered) to internet.
