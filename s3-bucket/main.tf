# resource "aws_s3_bucket" "test_purpose" {
#   bucket = "for-lock-"
#   acl    = "private"

#   versioning {
#     enabled = true
#   }

#   tags = {
#     Name        = "for lock tf"

#     Environment = "Dev"
#   }
# }

resource "aws_s3_bucket" "test_archibong" {
  bucket              = "test-archibong"
  force_destroy       = "true"
  object_lock_enabled = "false"


  tags = {
    Name        = "testing"
    Environment = "Dev"
  }
}

# resource "aws_s3_bucket_versioning" "tf_versioning" {
#   bucket = "test-hash"
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# # Upload object into the bucket
# resource "aws_s3_bucket_object" "test_archibong" {
#   bucket = "test_archibong"
#   key    = "show up.png"
#   source = "/home/hashbury/Documents/GitHub/terraform-demo/s3-bucket/another.jpeg"

#   # The filemd5() function is available in Terraform 0.11.12 and later
#   # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
#   # etag = "${md5(file("path/to/file"))}"
# }

