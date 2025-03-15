## Summary

A simple project with s3 bucket.

Buckets:
- public bucket with static website
- private bucket with read replication of 1st
- public bucket with limited ACL access

## CLI

```sh
# list buckets
aws s3 ls
# list objects in a bucket
aws s3 ls ${bucket}
# note that unlike Bash ls, glob pattern is not allowed. instead, use --bucket-name-prefix to filter
aws s3 ls --bucket-name-prefix ${prefix}
```

Getting object
```sh
# download a file in bucket to dest
aws s3api get-object --bucket ${bucket} --key ${key} ${dest}
# range query by bytes, useful for large files
aws s3api get-object --bucket ${bucket} --key ${key} --range bytes=${start}-${end} ${dest}
```

## ACL

by default, bucket blocks all public access while objects inside are accessible by all

To access public read access of s3 bucket objects:
- bucket access block needs to be disabled
- bucket policy must allow public s3:Get-Object access
- bucket object must not deny public access

## Replication

src -> dest

Conditions:
- both source and destination bucket needs versioning enabled
- read replication and list bucket policy on source bucket
- s3:GetObjectVersion___ policy on source bucket
- s3:Replicate___ policy on destination bucket

## Requester Pay

will show a message like this when not logged into AWS
```
403 Forbidden

Code: AccessDenied

Message: Requester Pays Enabled.
```

## Links

since bucket name is globally unique, the s3 url identifies an unique bucket in AWS

## MFA Delete

In S3 bucket versioning, you can choose to require MFA before deletion.

## Price

Using data on 2025-03-13 Tokyo region,

| Service                 | Price | Relative to S3 Standard |
|-------------------------|-------|-------------------------|
| S3 Standard             | 150   | 100%                    |
| S3 Infruquent Access    | 82.8  | 55.2%                   |
| S3 Express One Zone     | 1080  | 720%                    |
| S3 Glacier Instant      | 30    | 20%                     |
| S3 Glacier Flexible     | 27    | 18%                     |
| S3 Glacier Deep Archive | 12    | 8%                      |

```

Notice how even the cheapest option might still be more expensive
than buying SSD or HDD to store data for long-term

But it is an alternative to Google Drive, Dropbox, Box etc.
