
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucketname

  tags = {
    Name        = var.bucketname
    Environment = "Dev"
  }
}