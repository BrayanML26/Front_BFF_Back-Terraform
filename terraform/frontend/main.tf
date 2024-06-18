resource "aws_s3_bucket" "frontend_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
  
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "frontend_files" {
  for_each = fileset(path.module, "../my-books-app/build/**")
  
  bucket = aws_s3_bucket.frontend_bucket.id
  key    = each.key
  source = "${path.module}/../my-books-app/build/${each.key}"
  acl    = "public-read"
}

output "frontend_url" {
  value = aws_s3_bucket.frontend_bucket.website_endpoint
}
