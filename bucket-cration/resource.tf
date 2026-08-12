resource "aws_s3_bucket" "s3-key" {
  bucket = "s3-backend-terraform-akaz"
  force_destroy = true

}