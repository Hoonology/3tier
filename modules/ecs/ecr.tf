# ECR
resource "aws_ecr_repository" "my_repo" {
  name = "my_repo"
  
  image_scanning_configuration {
    scan_on_push = false
  }
}