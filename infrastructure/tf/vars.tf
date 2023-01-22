variable "VMNAME" {
  type = string
  description = "Tag Name for creating VM from system environments"
}

variable "aws_ssh_key" {
  type = string
  default = "ssh_aws"
}

variable "aws_instance_type" {
  type = string
  default = "t2.micro"
}