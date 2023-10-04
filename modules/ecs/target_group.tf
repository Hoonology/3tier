# Target Group
resource "aws_lb_target_group" "ecs_tg" {
  name     = "ecs-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"
}