resource "aws_security_group" "website_prod" {
  name   = "website-sg"
  vpc_id = aws_vpc.website_prod.id

  tags = {
    Name        = "website_server"
    Provisioned = "Terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.website_prod.id

  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "<seu_IP>/32" # possível verificar com curl ifconfig.me
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.website_prod.id

  from_port   = 80
  to_port     = 80
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.website_prod.id

  from_port   = 443
  to_port     = 443
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.website_prod.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}
