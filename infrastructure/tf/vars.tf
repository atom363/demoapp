variable "VMNAME" {
  type = string
  description = "Tag Name for creating VM from system environments"
}

variable "aws_region" {
  type = string
  default = "eu-central-1"
}
variable "aws_ssh_key" {
  type = string
  default = "ssh_aws"
}

variable "aws_instance_type" {
  type = string
  default = "t2.micro"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR for the VPC"
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR for the public subnet"
  default     = "10.10.0.0/24"
}