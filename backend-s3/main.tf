provider "aws" {
  region     = "us-east-1"
  access_key = "AKIASHGVDRT5WXVM7ZPM"
  secret_key = "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"
}



terraform {
  backend "s3" {
    bucket = "for-lock-tf"
    key    = "global/s3/terraform.tfstate"
    dynamodb_table = "GameScores"
    region = "us-east-1"
    encrypt = true
  }
}
