resource aws_cloudtrail trail {
	name = "log-login-event"
	s3_bucket_name = aws_s3_bucket.cloudtrail.id
	s3_key_prefix = "login/"

	include_global_service_events = true
}
