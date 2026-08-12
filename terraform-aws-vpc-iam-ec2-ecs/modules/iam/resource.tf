resource "aws_iam_role" "ec2_role" {
  name               = "website-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_ec2.json
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "website-ec2-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy_attachment" "ecr_read_only" {
  role       = aws_iam_role.ec2_role.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy" "s3_access" {
  name = "website-s3-access"
  role = aws_iam_role.ec2_role.id

  policy = data.aws_iam_policy_document.s3_access.json
}
