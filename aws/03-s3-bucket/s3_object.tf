resource "aws_s3_object" "objects" {
  bucket = aws_s3_bucket.public_bucket.id

  for_each = {
    "index.html" : data.local_file.index_page,
    "404.html" : data.local_file.error_404_page,
    "product-1" : data.local_file.product1,
    "product-2" : data.local_file.product2,
  }
  key = each.key
}
