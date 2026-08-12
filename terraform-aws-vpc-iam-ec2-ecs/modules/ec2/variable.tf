# === aws_instance ===
variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "security_group_id" {
  type = string
}

# === tls_private_key ===
variable "aws_key_name" {
  type = string
}

# === vpc module ===
variable "iam_instance_profile" {
  type = string
}

variable "subnet_id" {
  type = string
}





