module "ecr" {
  source = "./modules/ecr"
}

module "vpc" {
  source = "./modules/vpc"
}

module "iam" {
  source = "./modules/iam"

  s3_bucket_name = "s3-backend-terraform-akaz"
}

module "ec2" {
  source = "./modules/ec2"

  ami                  = "ami-0bdc7d025135d7b49"
  instance_type        = "t3.micro"
  aws_key_name         = "key_pair_terr"
  security_group_id    = module.vpc.security_group_id
  subnet_id            = module.vpc.subnet_id
  iam_instance_profile = module.iam.instance_profile_name
}

