# terraform {
#   backend "s3" {
#     bucket = "kaizen-aby"
#     key    = "terraform.tfstate"
#     region = "us-east-1"
#     dynamodb_table = "lock-state" #locking state file
#   }
# }