resource "aws_key_pair" "deployer" {

  key_name   = "${var.my_env}-terra-key"
  public_key = file("terra-key.pub")

}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_grp" {

  name        = "${var.my_env}-security-grp"
  description = "This is the security grp for EC2"
  vpc_id      = aws_default_vpc.default.id

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }



  tags = {
    Name = "${var.my_env}-security-grp"
  }


}


resource "aws_instance" "my_instance" {

    count = var.instance_count
    
    ami = var.ami
    instance_type = "t2.micro"
    key_name = aws_key_pair.deployer.key_name

    root_block_device {

      volume_size = 10
      volume_type = "gp3"
    
    }

    tags = {
      Name = "${var.my_env}-server"
    }
  
}