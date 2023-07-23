resource "aws_s3_bucket" "back-end-hash" {
  bucket = "for-lock-tf"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "for lock tf"
    Environment = "Dev"
  }
}