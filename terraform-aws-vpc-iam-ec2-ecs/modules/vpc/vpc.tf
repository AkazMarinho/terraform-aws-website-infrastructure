resource "aws_vpc" "website_prod" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "website-vpc"
    Provisioned = "Terraform"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.website_prod.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name        = "website-public-subnet"
    Provisioned = "Terraform"
  }
}

resource "aws_internet_gateway" "website_prod" {
  vpc_id = aws_vpc.website_prod.id

  tags = {
    Name        = "website-igw"
    Provisioned = "Terraform"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.website_prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.website_prod.id
  }

  tags = {
    Name        = "website-public-route-table"
    Provisioned = "Terraform"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
