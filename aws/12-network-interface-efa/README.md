## Summary

The network interface is the gateway of instance with network, which means its throughput, bandwidth and security is vital to the instance.

## Network Interface

All ec2 instances need a network interface to communicate in network. The network interface and instance must be in the same AZ and subnet.

## Network Interface Type

not specifing a type would result in 'interface' type, which is also the default eni
- efa
- efa-only
- branch
- trunk

## Device Index & Network Card Index

all instances can have more than one network interface attached

Each attached network interface would provide a private ip address to the instance. The network card at index 0 is the primary network card, it cannot be detached.

This is the ip info for an instance with more than one network interface.
```sh
>>> ip address
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enX0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP group default qlen 1000
    link/ether 0e:64:43:7c:0e:41 brd ff:ff:ff:ff:ff:ff
    altname eni-0cdd1785c7fe98571
    altname device-number-0.0
    inet 192.168.0.189/24 metric 512 brd 192.168.0.255 scope global dynamic enX0
       valid_lft 3498sec preferred_lft 3498sec
    inet6 fe80::c64:43ff:fe7c:e41/64 scope link proto kernel_ll 
       valid_lft forever preferred_lft forever
3: enX1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP group default qlen 1000
    link/ether 0e:aa:56:e7:eb:cf brd ff:ff:ff:ff:ff:ff
    altname eni-03cb58c4e63407cd7
    altname device-number-1.0
    inet 192.168.0.49/24 metric 513 brd 192.168.0.255 scope global dynamic enX1
       valid_lft 3498sec preferred_lft 3498sec
    inet6 fe80::caa:56ff:fee7:ebcf/64 scope link proto kernel_ll 
       valid_lft forever preferred_lft forever
```

the network latency between ec2 in the same subnet is about
```sh
20 packets transmitted, 20 received, 0% packet loss, time 19754ms
rtt min/avg/max/mdev = 0.016/0.028/0.035/0.003 ms
```

## Elastic Network Adapter

low latency network interface for ec2 instances.

EFA-only interface cannot be used as primary network interface as it does not provide ip address, its usage is to speed up data transfer between instances.
