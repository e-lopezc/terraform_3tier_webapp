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

resource "aws_instance" "my_webapp_server_1" {
  ami                    = var.amis[var.aws_region]
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.my_webapp_app_sg.id]
  subnet_id              = aws_subnet.public_subnet_1.id
  availability_zone      = "${var.aws_region}a"
  user_data              = <<EOF
    #! /bin/bash
    sudo su
    sudo yum update
    sudo yum install -y httpd
    sudo chkconfig httpd on
    sudo service httpd start
    echo "<h1>My Webapp Server 1</h1>" | sudo tee /var/www/html/index.html
    EOF

  tags = {
    Name = "my-webapp-server-1",
    Type = "web_server"
  }
}

resource "aws_instance" "my_webapp_server_2" {
  ami                    = var.amis[var.aws_region]
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.my_webapp_app_sg.id]
  subnet_id              = aws_subnet.public_subnet_2.id
  availability_zone      = "${var.aws_region}b"
  user_data              = <<EOF
    #! /bin/bash
    sudo su
    sudo yum update
    sudo yum install -y httpd
    sudo chkconfig httpd on
    sudo service httpd start
    echo "<h1>My Webapp Server 2</h1>" | sudo tee /var/www/html/index.html
    EOF

  tags = {
    Name = "my-webapp-server-2",
    Type = "web_server"
  }
}

resource "aws_instance" "my_webapp_db_server_active" {
  ami                    = var.amis[var.aws_region]
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.my_webapp_db_sg.id]
  subnet_id              = aws_subnet.private_subnet_1.id
  availability_zone      = "${var.aws_region}c"


  tags = {
    Name = "my-webapp-db-server-active"
  }
}


resource "aws_instance" "my_webapp_db_server_passive" {
  ami                    = var.amis[var.aws_region]
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.my_webapp_db_sg.id]
  subnet_id              = aws_subnet.private_subnet_2.id
  availability_zone      = "${var.aws_region}d"


  tags = {
    Name = "my-webapp-db-server-passive"
  }
}