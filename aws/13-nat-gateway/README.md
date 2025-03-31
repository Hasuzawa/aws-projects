## Summary


## Route Table

route table is an address book in a vpc

## NAT gateway

NAT gateway routes traffic 
One of the main usage is to allow instances in private subnet to access internet.

public NAT gateway is accessible to internet, so a public IP address is required, this is indicated by its allocation id.

## Elastic IP

Elastic IP can only be created in a vpc with internet gateway.

## Internet Gateway

One VPC can has either one or no internet gateway. Afterall, it is a virtual resource that communicates intent to subscribe to public internet.

This is the only network resource with no bandwidth constraint, and one of few that does not have an address (not even private IP).

## Note

NAT gateway **cannot** route private subnet in another VPC (even if peered) to internet.
