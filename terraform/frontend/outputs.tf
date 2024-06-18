output "frontend_bucket" {
  value = aws_s3_bucket.frontend_bucket.id
}

output "frontend_url" {
  value = aws_s3_bucket.frontend_bucket.website_endpoint
}
