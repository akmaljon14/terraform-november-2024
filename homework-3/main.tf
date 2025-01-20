provider aws {
    region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

data "aws_ami" "amazon_linux2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Canonical
}



#1
resource "aws_instance" "web1" {
  ami           = data.aws_ami.amazon_linux2.id
  instance_type = "t2.micro"
  availability_zone = "us-east-1a" 
  subnet_id = "subnet-01e01e792a0168380"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")


  tags = {
    Name = "web-1"
  }
}

output ec2-1 {
    value = aws_instance.web1.public_ip
    sensitive = true

}


#2
resource "aws_instance" "web2" {
  ami           = data.aws_ami.amazon_linux2.id
  instance_type = "t2.micro"
  availability_zone = "us-east-1b" 
  subnet_id = "subnet-08284a36425ccee15"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")


  tags = {
    Name = "web-2"
  }
}

output ec2-2 {
    value = aws_instance.web2.public_ip
    sensitive = true

}



#3
resource "aws_instance" "web3" {
  ami           = data.aws_ami.amazon_linux2.id
  instance_type = "t2.micro"
  availability_zone = "us-east-1c" 
  subnet_id = "subnet-017815e65ad088389"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")


   tags = {
     
     Name = "web-3"
 
  }

}

  output ec2-3 {
    value = aws_instance.web3.public_ip
    sensitive = true

}