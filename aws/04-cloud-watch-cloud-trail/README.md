## Summary

We set up some simple resource and configure CloudTrail and CloudWatch for them.





## Cloud Trail

Monitor events within AWS, including:

- managment events (IAM events, vpc, subnet cloudtrail events, login)

The s3 bucket specified to hold the logs must have some policy

- check acl of bucket
- write (s3:put) object to bucket

By default, it will write to a bucket in the form of
```
AWSLogs/user_id/CloudTrail/region/year/month/day/gz_file
```

a logged event looks like this (sensitive data removed)
```json
{
	"eventVersion": "1.10",
	"userIdentity": {
		"type": "IAMUser",
		"principalId": "x",
		"arn": "arn:aws:iam::x",
		"accountId": "x",
		"accessKeyId": "x",
		"userName": "x",
		"sessionContext": {
			"attributes": {
				"creationDate": "x",
				"mfaAuthenticated": "false"
			}
		}
	},
	"eventTime": "2025-03-16T15:06:55Z",
	"eventSource": "ec2.amazonaws.com",
	"eventName": "DescribeRegions",
	"awsRegion": "ap-northeast-1",
	"sourceIPAddress": "x",
	"userAgent": "x",
	"requestParameters": {
		"regionSet": {
		},
		"allRegions": true
	},
	"responseElements": null,
	"requestID": "x",
	"eventID": "1569796a-0d47-4b70-b7a5-255cfb94a74b",
	"readOnly": true,
	"eventType": "AwsApiCall",
	"managementEvent": true,
	"recipientAccountId": "x",
	"eventCategory": "Management",
	"tlsDetails": {
		"tlsVersion": "x",
		"cipherSuite": "x",
		"clientProvidedHostHeader": "ec2.ap-northeast-1.amazonaws.com"
	},
	"sessionCredentialFromConsole": "true"
}
```

## CloudWatch

monitor AWS platform event, metric, log
- (metric) alarm
- dashboard
- log
- event

The metric alarm is somewhat similar to Grafana or Splunk

network resources (vpc, subnet, eni) -- flow_log --> cloudwatch log group / s3 / kinesis

The ENI in the network resource would be monitored by cloudwatch and the eni will appear as log stream.

You can search for logs in CloudWatch > Logs Insights

This is what a v2 flow log looks like

| Field                              | Value                     |
|------------------------------------|---------------------------|
| @entity.KeyAttributes.ResourceType | AWS::EC2::VPC             |
| @entity.KeyAttributes.Type         | AWS::Resource             |
| @entity.KeyAttributes.Identifier   | vpc-05c2f02afb634098c     |
| @ingestionTime                     | 1742298783134             |
| @log                               | 277707107708:traffic-logs |
| @logStream                         | eni-0433dd2a8e212c162-all |
| @message                           | (too long, removed)       |
| @timestamp                         | 1742298707000             |
| accountId                          | xxxx (removed)            |
| end                                | 1742298769                |
| interfaceId                        | eni-0433dd2a8e212c162     |
| logStatus                          | NODATA                    |
| start                              | 1742298707                |
| version                            | 2                         |

### Resource Group

filter some resource to be monitored together





## Note

AWS Lambda is billed for duration, memory usage and time invoked. Thus they should be used for short routine with predictable execution time.

If Terraform takes long time to delete a resource (e.g. vpc, subnet), most likely there are some resources attached to it that is not managed by Terraform.
- instance
- security group
- vpc endpoint


