resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.my_webapp.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.my_webapp.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public-subnet-2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.my_webapp.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = "${var.aws_region}c"

  tags = {
    "Name" = "private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.my_webapp.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = "${var.aws_region}d"

  tags = {
    "Name" = "private-subnet-2"
  }
}

