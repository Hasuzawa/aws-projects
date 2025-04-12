## Summary

Spot instance and fleet allows provisioning instances at lower cost than on-demand price, at expense of less guarantee.

## Spot Instance

features
- price differ by AZ (about 30 - 40% of in-demand)
- can be one-time or persistent

When you create a spot instance, you actually create a spot request to be fullfilled by cloud immediately.

## Spot Request

Cancelling a request does **not** termiante the associated instance.

A one-time spot means a request that would be fulfilled at most once.

A persistent spot means the request become open again after the instance is interrupted, and can be fulfilled again. Manually stopping an instance does not open the spot request.

## Spot Fleet

AWS now recommends using ec2 fleet with spot options in an ASG instead.

## Spot Instance lifecycle


## Terraform specific

Creating a spot instance directly means creating a spot request that must be fulfilled when you apply. When deleting the resource, the spot request will be cancelled and the spot instance would be terminated.

Although cancelling a spot request does not terminate associated instance, deleting a Terraform spot request resource will terminate associated instance.

## Further

EC2 capacity block is specialized instance for ML training.

in Terraform, if you omit max price or set it to 0 for spot instances, it will mean you accept whatever price (but often still considerably lower than on-demand)
