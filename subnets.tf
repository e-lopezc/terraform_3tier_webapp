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

resource "aws_subnet" "private_app_subnet_1" {
  vpc_id            = aws_vpc.my_webapp.id
  cidr_block        = var.private_app_subnet_1_cidr
  availability_zone = "${var.aws_region}c"

  tags = {
    "Name" = "private-app-subnet-1"
  }
}

resource "aws_subnet" "private_app_subnet_2" {
  vpc_id            = aws_vpc.my_webapp.id
  cidr_block        = var.private_app_subnet_2_cidr
  availability_zone = "${var.aws_region}d"

  tags = {
    "Name" = "private-app-subnet-2"
  }
}

resource "aws_subnet" "private_db_subnet_1" {
  vpc_id            = aws_vpc.my_webapp.id
  cidr_block        = var.private_db_subnet_1_cidr
  availability_zone = "${var.aws_region}e"

  tags = {
    "Name" = "private-db-subnet-1"
  }
}

resource "aws_subnet" "private_db_subnet_2" {
  vpc_id            = aws_vpc.my_webapp.id
  cidr_block        = var.private_db_subnet_2_cidr
  availability_zone = "${var.aws_region}f"
  tags = {
    "Name" = "private-db-subnet-2"
  }
}