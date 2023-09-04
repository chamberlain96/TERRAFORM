resource "aws_s3_bucket" "mybuk" {
  bucket = "travisbackend1234"
  versioning {
    enabled = true
}
  server_side_encryption_configuration {  
      rule {
      apply_server_side_encryption_by_default {
        sse_algorithm    =  "AES256"
}
    }
}
}


resource "aws_dynamodb_table" "statelock" {
  name             = "state-lock"
  hash_key         = "lockID"
  billing_mode     = "PAY_PER_REQUEST"
  attribute {
    name = "lockID"
    type = "S"
  }
}