resource "aws_vpc" "my_webapp" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "my-webapp"
  }
}

resource "aws_internet_gateway" "my_webapp_igw" {
  vpc_id = aws_vpc.my_webapp.id

  tags = {
    Name = "my-webapp-igw"
  }
}