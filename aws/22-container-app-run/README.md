## Summary

AppRun is a service for running app with minimum management.
One of the usage is to run container images.
In fact, AppRunner is perhaps the most convenient way to run one-container application.

It is a regional service, but it is not available in all region (e.g. not in us-west-1)

## Details

- cannot use automatic deployment for public images

## Connected Account

Read repository to deploy application
- GitHub
- BitBucket

## VPC connector & endpoint

A VPC endpoint can be used to point to a AppRunner container.

## Cost

|               | us    | jp    |
|---------------|-------|-------|
| per vcpu-hour | 0.064 | 0.081 |
| per GB-hour   | 0.007 | 0.009 |

There are some extra cost for build and automated deployment.
