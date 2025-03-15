resource "aws_s3_object" "objects" {
  bucket = aws_s3_bucket.public_bucket.id

  for_each = {
    "index.html" : data.local_file.index_page,
    "error.html" : data.local_file.error_page,
  }
  key          = each.key
  source       = each.value.filename
  content_type = "text/html"
}

resource "aws_s3_object" "json" {
  bucket = aws_s3_bucket.public_bucket.id

  for_each = {
    "product/1.json" : data.local_file.product1,
    "product/2.json" : data.local_file.product2,
  }
  key          = each.key
  source       = each.value.filename
  content_type = "application/json"
}
