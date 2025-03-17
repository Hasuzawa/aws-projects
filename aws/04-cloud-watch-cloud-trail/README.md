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


### Resource Group

filter some resource to be monitored together





## Note

AWS Lambda is billed for duration, memory usage and time invoked.
