output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.my_vpc.id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = aws_subnet.my_subnet.id
}

output "security_group_id" {
  description = "The ID of the Security Group"
  value       = aws_security_group.my_security_group.id
}