resource "aws_dynamodb_table" "my-dynamodb-table" {
  name         = "${var.my_env}-db-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = "${var.my_env}-db-table"
  }

}
