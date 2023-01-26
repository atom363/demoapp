provider "aws" {
  region = "eu-central-1"
}
resource "aws_instance" "tfvm" {
  ami = "ami-03e08697c325f02ab"
  instance_type = var.aws_instance_type
  key_name = var.aws_ssh_key
  vpc_security_group_ids = [ aws_security_group.demoappsg.id ]
  tags = {
    Name = var.VMNAME
  }
}
resource "aws_security_group" "demoappsg" {
  name = "demoapp-sg"
  ingress {
    protocol = "tcp"
    from_port = 5000
    to_port = 5000
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [ "0.0.0.0/0" ]
  }
    ingress {
    protocol = "tcp"
    from_port = 3000
    to_port = 3000
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
output "instance_ips" {
  value = aws_instance.tfvm.public_ip
}