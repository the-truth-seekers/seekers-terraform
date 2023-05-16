resource "aws_s3_bucket" "bucket_project" {
  bucket = var.BUCKET_NAME
}

# resource "aws_s3_bucket_acl" "bucket_acl_project" {
#   bucket = aws_s3_bucket.bucket_project.id
#   acl    = "private"
# }

resource "aws_s3_bucket_public_access_block" "bucket_pab_project" {
  bucket                  = aws_s3_bucket.bucket_project.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}