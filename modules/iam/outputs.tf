output "ecs_execution_role_arn" {
  value = aws_iam_role.ecs_execution_role_tf.arn
}

output "ecs_task_role_arn" {
  value = aws_iam_role.ecs_task_role_tf.arn
}
