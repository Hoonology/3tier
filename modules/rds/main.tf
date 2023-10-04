module "vpc" {
  source = "../vpc"
}

# RDS DB 파라미터 그룹 생성 for PostgreSQL
resource "aws_db_parameter_group" "rds-params" {
  name   = "rds-params"
  family = "postgres15"
## 파라미터 설정
   parameter {
    name  = "client_encoding"
    value = "UTF8"                                                                                                
  }
}
# RDS인스턴스 생성
resource "aws_db_instance" "rds-instance" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "15.3"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = var.DB_USER
  password             = var.DB_PASSWORD
  parameter_group_name = aws_db_parameter_group.rds-params.name
  db_subnet_group_name = aws_db_subnet_group.private_subnet_group.name
  vpc_security_group_ids = [module.vpc.vpc_sg_id]
  skip_final_snapshot    = true
}
