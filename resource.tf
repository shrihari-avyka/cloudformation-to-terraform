resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.environment_name}-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id = aws_vpc.my_vpc.arn
  cidr_block = var.subnet_cidr_block
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment_name}-subnet"
  }
}

resource "aws_security_group" "my_security_group" {
  description = "Allow SSH access"
  vpc_id = aws_vpc.my_vpc.arn
  ingress = [
    {
      protocol = "tcp"
      from_port = 22
      to_port = 22
      cidr_blocks = var.allowed_ssh_location
    }
  ]
  tags = {
    Name = "${var.environment_name}-sg"
  }
}

