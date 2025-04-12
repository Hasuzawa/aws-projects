## Summary

Spot instance and fleet allows provisioning instances at lower cost than on-demand price, at expense of less guarantee.

## Spot Instance

features
- price differ by AZ (about 30 - 40% of in-demand)
- can be one-time or persistent

When you create a spot instance, you actually create a spot request to be fullfilled by cloud. 

A one-time spot means a request that would be fulfilled at most once.

A persistent spot means the request become open again after the instance is interrupted, and can be fulfilled again. Manually stopping an instance does not open the spot request.

Deleting a spot instance with Terraform would cancel the request. Note that cancelling a request does **not** termiante the associated instance.

You will get a creation error for ec2 instance when the price you set is below the minimum fulfillment price.

## Spot Fleet



## Spot Instance lifecycle




## Further

EC2 capacity block is specialized instance for ML training.

in Terraform, if you omit max price or set it to 0 for spot instances, it will mean you accept whatever price (but often still considerably lower than on-demand)
