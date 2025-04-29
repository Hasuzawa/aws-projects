## Summary

Route 53 is the frontier for web traffic and a global service.


## Hosted Zone

public

private


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

