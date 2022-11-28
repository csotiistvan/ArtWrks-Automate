# Application load balancer

resource "aws_lb" "schiele-alb" {
  name            = "schiele-alb"
  internal           = false
  load_balancer_type = "application"
  enable_http2 = false
  security_groups = [aws_security_group.generic_server.id]
  subnets         = [aws_subnet.sch-public.id]
  tags = {
    Name = "Artworks_ALB_Schiele"
    Email = "csoti.istvan.ifj@gmail.com"
    Comment = "Made with Terraform thru Github CI/CD"
  }
}

# Target group for load balancer

resource "aws_lb_target_group" "sch_group" {
  name     = "schiele-alb-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.schiele.id
  stickiness {
    type = "lb_cookie"
    enabled = false
  }
  health_check {
    port = 80
    healthy_threshold = 5
    unhealthy_threshold = 5
    timeout = 10
    interval = 30
  }
}

# HTTP listener for the load balancer

resource "aws_lb_listener" "lb_listener_http" {
  load_balancer_arn = "${aws_lb.schiele-alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.sch_group.arn}"
    type             = "forward"
  }
}
