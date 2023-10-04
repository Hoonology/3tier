output "ecr_repository_url" {
  description = "The URL of the created ECR repository"
  value       = aws_ecr_repository.my_repo.repository_url
}

output "ecr_repository_arn" {
  description = "The ARN of the ECR repository"
  value       = aws_ecr_repository.my_repo.arn
}