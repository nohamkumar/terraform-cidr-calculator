provider "aws" {
  region = "us-east-1"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

locals {
  public_cidr_block  = cidrsubnet(var.cidr_block, 1, 0)
  private_cidr_block = cidrsubnet(var.cidr_block, 1, 1)
}




output "cidr1" {
  value = [for index in range(8) :
  cidrsubnet(local.public_cidr_block, 3, index)]
}

output "cidr2" {
  value = [for index in range(8) :
  cidrsubnet(local.private_cidr_block, 3, index)]
}
