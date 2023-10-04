
# 보안그룹
resource "aws_security_group" "vpc-sg" {
  vpc_id = aws_vpc.tvpc.id
  name = "vpc-sg"
  description = "VPC Security Group"
  tags = {
    Name = "VPC SG"
  }
}

## 보안그룹 Rule
### ingress - 포트 22
resource "aws_security_group_rule" "vpc-private-sg-ingress-22" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpc-sg.id

  lifecycle {
    create_before_destroy = true
  }
}
### ingress - 포트 80
resource "aws_security_group_rule" "vpc-private-sg-ingress-80" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpc-sg.id

  lifecycle {
    create_before_destroy = true
  }
}

### ingress - 포트 443
resource "aws_security_group_rule" "vpc-private-sg-ingress-443" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpc-sg.id

  lifecycle {
    create_before_destroy = true
  }
}

### ingress - 포트 3000
resource "aws_security_group_rule" "vpc-private-sg-ingress-3000" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpc-sg.id

  lifecycle {
    create_before_destroy = true
  }
}

### ingress - 포트 3306
resource "aws_security_group_rule" "vpc-private-sg-ingress-3306" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpc-sg.id

  lifecycle {
    create_before_destroy = true
  }
}

### egress - 0
resource "aws_security_group_rule" "vpc-private-sg-egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpc-sg.id
  lifecycle {
    create_before_destroy = true
  }
}


