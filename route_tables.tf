resource "aws_route_table" "my_webapp_public_rt" {
  vpc_id = aws_vpc.my_webapp.id

  tags = {
    "Name" = "my-webapp-public-rt"
  }

}

# public route table
resource "aws_route" "int_public_route" {
  route_table_id         = aws_route_table.my_webapp_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_webapp_igw.id

}

resource "aws_route_table_association" "public_rt_assoc_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.my_webapp_public_rt.id
}

resource "aws_route_table_association" "public_rt_assoc_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.my_webapp_public_rt.id
}

# private app route table
resource "aws_route_table" "my_webapp_private_app_rt" {
  vpc_id = aws_vpc.my_webapp.id
  tags = {
    "Name" = "my-webapp-private-app-rt"
  }

}

# private db route table
resource "aws_route_table" "my_webapp_private_db_rt" {
  vpc_id = aws_vpc.my_webapp.id
  tags = {
    "Name" = "my-webapp-private-db-rt"
  }

}

# private app subnets and route tables associations
resource "aws_route_table_association" "private_app_rt_assoc_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.my_webapp_private_app_rt.id
}

# private db subnets and route tables associations
resource "aws_route_table_association" "private_db_rt_assoc_1" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.my_webapp_private_db_rt.id
}


