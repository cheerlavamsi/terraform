resource "aws_lb" "prod-lb" {
  name               = "prod-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.SG_WEB_PUB]
  subnets            = var.PUBLIC_SUBNETS

  enable_deletion_protection = false

  //access_logs {
  //  bucket  = var.LOG_BUCKET
  //  prefix  = "prod-lb"
  //  enabled = true
  //}

  tags = {
    Environment = "production-alb"
  }
}

resource "aws_lb_listener" "mainapp" {
  load_balancer_arn       = aws_lb.prod-lb.arn
  port                    = "80"
  protocol                = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.prod-targets.arn
  }
}


resource "aws_lb_target_group" "prod-targets" {
  name     = "studentapp-targets"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.VPCID
}

resource "aws_lb_target_group_attachment" "prod-studentapp-targets" {
  count             = var.INSTANCE_COUNT
  target_group_arn  = aws_lb_target_group.prod-targets.arn
  target_id         = element(var.INSTANCE_IDS, count.index)
  port              = 80
}
