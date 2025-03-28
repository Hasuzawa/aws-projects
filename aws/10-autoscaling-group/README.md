## Summary

ASG is one of the most powerful tool, as you can create application that adjust its own resource usage with it.

## Launch Template

This is not specific to ASG, but this becomes required in ASG when deploying instance.

You delegate a recipe to ASG to create instance with it.

features
- enclave (lockdown-level information security)
- hibernation (RAM is written to RBS root volume, have many requirements)
- network, cpu, maintenance, placement configs

## Launch Configuration

Deprecated.

## Placement Group

cluster
- instances concentrated in one AZ
- fast inter-instance access

partition
- instances with same partition number are grouped together
- suitable for distributed computing (e.g. Hadoop, Cassandra)

spread
- try to spread across AZ to ensure high availability (will not fail if only one AZ is provided)
- do not share hardware, network resources

## Mixed Instances

Instance weight
- does NOT determine the proportion of each instance type launched (unlike CSS flex)

## Some config

min time between each adjustment
