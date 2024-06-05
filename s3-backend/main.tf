provider "aws" {
  region = "us-east-1"  # You can choose your preferred region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "t2s-s3-terraform"
}

resource "aws_dynamodb_table" "terraform_locks" {
  name           = "my-lock-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
