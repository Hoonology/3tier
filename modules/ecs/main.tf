module "iam_roles" {
  source = "../iam"
}



# ECS Cluster
resource "aws_ecs_cluster" "my_cluster" {
  name = "my_cluster"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

# ECS service
resource "aws_ecs_service" "my_service" {
  name            = "my-ecs-service"
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_tg.arn
    container_name   = "container"
    container_port   = 3000
  }

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = [aws_security_group.ecs_sg.id]
  }
}