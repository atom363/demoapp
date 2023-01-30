provider "aws" {
  region = var.aws_region
}
data "aws_ami" "ubuntu-linux-2204" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server*"]
  }
  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
resource "aws_instance" "demoapp-vm" {
  ami = data.aws_ami.ubuntu-linux-2204.id
  instance_type = var.aws_instance_type
  subnet_id = aws_subnet.demoapp-public-subnet.id
  key_name = var.aws_ssh_key
  vpc_security_group_ids = [ aws_security_group.demoappsg.id ]
  associate_public_ip_address = true
  tags = {
    Name = var.VMNAME
  }
}
resource "aws_security_group" "demoappsg" {
  name = "demoapp-sg"
  vpc_id = aws_vpc.demoapp-vpc.id
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
  value = aws_instance.demoapp-vm.public_ip
}