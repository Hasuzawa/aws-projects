// allow cloudtrail to write to bucket
data aws_iam_policy_document cloudtrail {
	statement {
		sid = "cloudtrail-read-bucket-acl"
		effect = "Allow"
		principals {
			type = "Service"
			identifiers = ["cloudtrail.amazonews.com"]
		}
		actions = ["s3:GetBucketAcl"]
		resources = [aws_s3_bucket.cloudtrail.arn]
	}

	statement {
		sid = "cloudtrail-write-log-to-bucket"
		effect = "Allow"
		principals {
			type = "Service"
			identifiers = ["cloudtrail.amazonews.com"]
		}
		actions = ["s3:PutObject"]
		resources = [aws_s3_bucket.cloudtrail.arn]
	}
}

# for extra safety, you should restrict the source arn to only one cloudtrail
