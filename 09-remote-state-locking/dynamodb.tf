resource "aws_dynamodb_table" "terraform_state_lock" {
  name    = "terraform-lock"
  read_capacity = 5
  write_capacity  = 5
  hash_key    = "LOCKID"
  attribute {
    name    = "LOCKID"
    type  = "S"
  }
  
}

