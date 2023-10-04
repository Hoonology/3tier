output "vpc_id" {
  value = aws_vpc.tvpc.id
}

output "subnet_ids" {
  value = [aws_subnet.PublicSubnet01.id, aws_subnet.PublicSubnet02.id]
}
# RDS 인스턴스 생성에 쓰임 - 모듈 실행 시 tf init 필수 
output "vpc_sg_id" {
  description = "The ID of the VPC security group"
  value       = aws_security_group.vpc-sg.id
}
