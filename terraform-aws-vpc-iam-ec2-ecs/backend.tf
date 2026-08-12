# state.tf
terraform {
  backend "s3" {
    bucket  = "s3-backend-terraform-akaz"
    key     = "site/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
