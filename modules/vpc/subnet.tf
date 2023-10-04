
# 서브넷
## 1. 퍼블릭 1, 2
resource "aws_subnet" "PublicSubnet01" {
  vpc_id     = aws_vpc.tvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-1"
  }
}

resource "aws_subnet" "PublicSubnet02" {
  vpc_id     = aws_vpc.tvpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-2"
  }
}
## 2. 프라이빗 1,2 
resource "aws_subnet" "PrivateSubnet01" {
  vpc_id = aws_vpc.tvpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2a"
  
  tags = {
    Name = "my-private-subnet01"
  }
}

resource "aws_subnet" "PrivateSubnet02" {
  vpc_id = aws_vpc.tvpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-northeast-2c"
  
  tags = {
    Name = "my-private-subnet02"
  }
}
