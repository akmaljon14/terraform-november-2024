provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket        = "kaizen-akmaly"
  force_destroy = true
}

resource "aws_s3_object" "object" {
  depends_on = [aws_s3_bucket.example]
  bucket     = "kaizen-akmaly"
  key        = "main.tf"
  source     = "main.tf"
}
