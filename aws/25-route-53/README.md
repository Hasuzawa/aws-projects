## Summary

Route 53 is the frontier for web traffic and a global service.

## Domain Name

a domain name can be purchased from AWS, or brought in from another registra.

The price for different top level domain (TLD) varys, e.g. .jp might be more expensive than .com, .us

## Hosted Zone

public
- resovles DNS query in public internet

private
- resolves DNS query within one or more VPC
- requires a vpc association at all time
- does not require the domain name to be registered

A VPC can be associated with more than one hosted zone, but they must have different domain name.

There is a soft cap of 500 hosted zones and 10_000 records per zone, beyond that contact or price is increased.

## DNS records

NS (name server), SOA (start of authority)
- created by default, do not overwrite or remove without good reason

A
- resolves to ipv4 address

AAAA
- resolves to ipv6 address

Alias
- must have same record type (A, AAAA, CNAME etc) of target record
- always have TTL of 60s
- can be used route a DNS to AWS resources, e.g. ELB, CloudFront, S3, APIG
- not charged

CNAME
- point to another record for non-apex zone

## DNS Protocol

- Do53
  - query using UDP or TCP over port 53. This does not encrypt data in-flight.
- DoH
  - DNS over HTTPS
- DoH-FIPS
  - DNS over HTTP while comply with FIPS standard

## Resolver

Allows DNS query out of AWS Cloud, commonly seen in hybrid cloud setup.

```
# inbound query
local network ------> Route 53 ------> VPC (of the instance) ------> instance

# outbound query
local network <------ Route 53 <------ VPC+2 <------ instance
```

Outbound query have to pass through a chosen VPC first, similar to a terminal in airport.

## DNS Firewall

DNS Firewall can block some query of domain name in associated VPC.

## Forward query

DNS query in cloud can be delegated to another DNS server, possibly out of cloud, by forwarding the query. This is common in hybrid cloud setup to maintain single source of truth.

Another use case is to forward DNS query to a VPC in another account.

## Cost

0.50 / zone month for first 25 hosted zone, beyond that 0.10

## Quota

```shell
aws route53 get-account-limit --type MAX_HOSTED_ZONES_BY_OWNER

# type = MAX_RRSETS_BY_ZONE / MAX_VPCS_ASSOCIATED_BY_ZONE
aws route53 get-hosted-zone-limit --hosted-zone-id $(id) --type $(type)
```
