
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucketname

  tags = {
    Name        = var.bucketname
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = var.bucketname.id 
  versioning_configuration {
    status = "Enabled"
  }
}
