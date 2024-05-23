provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "shell-scripting" {
  ami = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  key_name = "first-keypair"
  vpc_security_group_ids = [aws_security_group.ssh_access.id] #Opening port 22 for inbound
  tags = {
    Name = "shell-scripting"
  }
}

resource "aws_security_group" "ssh_access" {
  name = "ssh-access-sg-terraform"
  description = "Security Group for ec2 created from terraform"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
