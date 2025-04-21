## Summary

Lightsail is a managed service for applications.
It offers very high level cloud architecture without worrying about details. 

## Instance

List blueprints, which are apps or OS image.
```sh
aws lightsail get-blueprints
```

List instance plan, bundles
```sh
aws lightsail get-bundles
```

## ELB

Noticeably, a lightsail ELB is a regional app, unlike normal ELB which lives in one AZ.

## Cost

Simple comparison:

|          | ec2 instance | lightsail |
|----------|--------------|-----------|
| instance | t3.micro     | micro_3_0 |
| cost     | 9.792        | 7         |
| instance | t3.large     | large_3_0 |
| cost     | 78.336       | 44        |

That means using Lightsail is cheaper than using on-demand ec2 instance,
but using reserved instance or spot instance could cut 70% cost, which would become cheaper than lightsail instance.

ELB: 18 / month
Storage: 0.1 / GB month
DNS: using DNS Zone does not incur a cost, but the DNS itself has a cost
