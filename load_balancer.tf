# Load Balancing

data "aws_instances" "ec2_list" {

  instance_tags = {
    Type = "web_server"
  }
  depends_on = [
    aws_instance.my_webapp_server_1,
    aws_instance.my_webapp_server_2
  ]
}

# target group app elb

resource "aws_lb_target_group" "my_webapp_tg" {
  name        = "my-webapp-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.my_webapp.id
  target_type = "instance"

  health_check {
    healthy_threshold   = var.health_check["healthy_threshold"]
    interval            = var.health_check["interval"]
    unhealthy_threshold = var.health_check["unhealthy_threshold"]
    timeout             = var.health_check["timeout"]
    path                = var.health_check["path"]
    port                = var.health_check["port"]
  }
}

resource "aws_lb_target_group_attachment" "my_webapp_tg_attach" {
  count            = 2
  target_group_arn = aws_lb_target_group.my_webapp_tg.arn
  target_id        = data.aws_instances.ec2_list.ids[count.index]
  port             = 80

  depends_on = [
    data.aws_instances.ec2_list
  ]
}

# app elb
resource "aws_lb" "my_webapp_elb" {
  name                             = "my-webapp-elb"
  internal                         = false
  load_balancer_type               = "application"
  subnets                          = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  enable_cross_zone_load_balancing = "true"
  security_groups                  = [aws_security_group.my_webapp_elb_sg.id]
  tags = {
    Name = "my-webbapp-elb"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.my_webapp_elb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "forward"
    forward {
      target_group {
        arn = aws_lb_target_group.my_webapp_tg.arn
      }
    }
  }
}

