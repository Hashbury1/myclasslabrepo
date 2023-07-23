provider "aws" {
  region     = "us-east-1"
  access_key = "AKIASHGVDRT5WXVM7ZPM"
  secret_key = "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"
}


# create dynamodb table

resource "aws_dynamodb_table" "hash-new-table" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "Hash"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "Hash"
    type = "S"
  }

  attribute {
    name = "TopScore"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  global_secondary_index {
    name               = "HashIndex"
    hash_key           = "Hash"
    range_key          = "TopScore"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }

  tags = {
    Name        = "new-table"
    Environment = "testing"
  }
}