# Execution Role for ECS Task 
resource "aws_iam_role" "ecs_execution_role_tf" {
  name = "ecs_execution_role_tf"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      },
      Effect = "Allow",
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_attachment" {
  role       = aws_iam_role.ecs_execution_role_tf.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# Task Role for ECS Task
resource "aws_iam_role" "ecs_task_role_tf" {
  name = "ecs_task_role_tf"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      },
      Effect = "Allow",
    }]
  })
}

resource "aws_iam_policy" "rds_access_tf" {
  name        = "RDSTask_Access"
  description = "Allow ECS tasks to access RDS instances"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = ["rds:Describe*", "rds:ExecuteStatement"],
      Resource = ["*"],
      Effect = "Allow",
    }]
  })
}

resource "aws_iam_role_policy_attachment" "rds_task_attachment" {
  role       = aws_iam_role.ecs_task_role_tf.name
  policy_arn = aws_iam_policy.rds_access_tf.arn
}
