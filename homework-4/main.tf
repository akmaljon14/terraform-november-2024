provider "aws" {
  region = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = "${var.region}a"
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = var.instance_name
  }
}


output ec2 {
    value = aws_instance.web.public_ip
}