
resource "aws_s3_bucket" "bucket" {
  bucket = "tf-test-prod"

  tags = {
    Name        = "tf-test-prod"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = "tf-test-prod"
  versioning_configuration {
    status = "Enabled"
  }
}
