
# 보안그룹
resource "aws_security_group" "rds-private-sg" {
  name        = "rds-private-sg"
  description = "My private security group for PostgreSQL RDS"
  vpc_id      = module.vpc.vpc_id
}
## 보안그룹 Rule
resource "aws_security_group_rule" "rds-private-sg-ingress" {
  type              = "ingress"
  from_port   = 5432 # postgreSQL 전용 포트
  to_port     = 5432 # postgreSQL 전용 포트
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # 모든 IP를 허용하므로 실제 환경에서는 보안을 위해 수정이 필요합니다.
  security_group_id = aws_security_group.rds-private-sg.id

    lifecycle {
    create_before_destroy = true
  }
 }

resource "aws_security_group_rule" "rds-private-sg-egress" {
  type              = "egress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rds-private-sg.id

  lifecycle {
    create_before_destroy = true
  }
}

