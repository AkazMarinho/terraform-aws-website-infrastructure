
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "aws_key_pair" "ec2_key" {
  key_name   = var.aws_key_name #"key_pair_terr"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "aws_instance" "website_server" {
  ami                  = var.ami           #"ami-0bdc7d025135d7b49"
  instance_type        = var.instance_type #"t3.micro"
  key_name             = aws_key_pair.ec2_key.key_name
  subnet_id            = var.subnet_id
  iam_instance_profile = var.iam_instance_profile

  vpc_security_group_ids = [
    var.security_group_id
  ]

  tags = {
    Name        = "website_server"
    Provisioned = "Terraform"
  }
}

resource "local_file" "private_key" {
  filename        = "${path.root}/key_pair.pem"
  content         = tls_private_key.ec2_key.private_key_pem
  file_permission = "0400"
}
