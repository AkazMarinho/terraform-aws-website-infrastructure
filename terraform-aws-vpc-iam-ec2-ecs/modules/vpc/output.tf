output "security_group_id" {
  value = aws_security_group.website_prod.id
}

output "subnet_id" {
  value = aws_subnet.public.id
}