# RDS 서브넷 그룹 생성
resource "aws_db_subnet_group" "private_subnet_group" {
  name       = "private_subnet_group"
  subnet_ids = module.vpc.subnet_ids

  tags = {
    Name = "private_subnet_group"
  }
}
