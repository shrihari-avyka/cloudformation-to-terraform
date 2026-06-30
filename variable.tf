variable environment_name {
  description = "Environment name that will be prefixed to resource tags."
  type = string
  default = "dev"
}

variable vpc_cidr_block {
  description = "CIDR block for the VPC."
  type = string
  default = "10.0.0.0/16"
}

variable subnet_cidr_block {
  description = "CIDR block for the Subnet."
  type = string
  default = "10.0.1.0/24"
}

variable allowed_ssh_location {
  description = "The IP address range that can be used to SSH to the EC2 instances."
  type = string
  default = "0.0.0.0/0"
}

