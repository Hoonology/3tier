# Security Group
resource "aws_security_group" "ecs_sg" {
  name        = "ecs-sg"
  description = "ECS Security Group"
  vpc_id      = var.vpc_id
}

