# Creating bastion host in public subnet 1
resource "aws_instance" "bastion_host" {
  ami                         = var.amis[var.aws_region]
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.my_webapp_bastion_sg.id]
  subnet_id                   = aws_subnet.public_subnet_1.id
  availability_zone           = "${var.aws_region}a"
  associate_public_ip_address = true

  tags = {
    Name = "bastion-host"
  }
}

resource "aws_instance" "my_webapp_app_server_1" {
  ami                    = var.amis[var.aws_region]
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.my_webapp_app_sg.id]
  subnet_id              = aws_subnet.private_app_subnet_1.id
  availability_zone      = "${var.aws_region}c"

  tags = {
    Name = "my-webapp-app-server-1"
  }
}

resource "aws_instance" "my_webapp_app_server_2" {
  ami                    = var.amis[var.aws_region]
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.my_webapp_app_sg.id]
  subnet_id              = aws_subnet.private_app_subnet_2.id
  availability_zone      = "${var.aws_region}d"

  tags = {
    Name = "my-webapp-app-server-2"
  }
}

resource "aws_instance" "my_webapp_db_server" {
  ami                    = var.amis[var.aws_region]
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.my_webapp_db_sg.id]
  subnet_id              = aws_subnet.private_db_subnet_1.id
  availability_zone      = "${var.aws_region}e"


  tags = {
    Name = "my-webapp-db-server"
  }
}