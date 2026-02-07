resource "random_id" "suffix" {
  byte_length = 2
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.my_env}-bucket-${random_id.suffix.hex}"

  tags = {
    Name        = "${var.my_env}-bucket-${random_id.suffix.hex}"
    Environment = var.my_env
  }
}