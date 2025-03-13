resource "aws_s3_bucket" "private_bucket" {
  bucket = "${var.project}-private-bucket"
}

# resource "aws_s3_bucket_replication_configuration" "private_bucket_replica_config" {
#   bucket = aws_s3_bucket.private_bucket.id
#   role   = ""
#   rule {
#     id     = "from-public-bucket-to-private-bucket" # replication rule name
#     status = "Enabled"

#     destination {
#       bucket        = aws_s3_bucket.private_bucket.id
#       storage_class = ""
#     }
#   }
# }
