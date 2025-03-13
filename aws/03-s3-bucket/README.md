## Summary

A simple project with s3 bucket.

Buckets:
- public bucket with static website
- private bucket with read replication of 1st
- public bucket with limited ACL access

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
