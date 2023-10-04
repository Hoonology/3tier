# Task Definition
resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = "my-task-definition"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn = module.iam_roles.ecs_execution_role_arn
  task_role_arn      = module.iam_roles.ecs_task_role_arn

  container_definitions    = jsonencode([{
    name  = "container"
    image = "${aws_ecr_repository.my_repo.repository_url}:latest"
    portMappings = [{
      containerPort = 3000
    }]
  }])
}