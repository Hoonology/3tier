
# 라우팅 테이블
## 1. 퍼블릭 라우팅 테이블 정의
resource "aws_route_table" "t-public-route-table" {
  vpc_id = aws_vpc.tvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-IGW.id
  }
}

## 2. 퍼블릭 라우팅 테이블 연결
resource "aws_route_table_association" "my-public-RT-Assoication01" {
  subnet_id      = aws_subnet.PublicSubnet01.id
  route_table_id = aws_route_table.t-public-route-table.id
}
resource "aws_route_table_association" "my-public-RT-Assoication02" {
  subnet_id = aws_subnet.PublicSubnet02.id
  route_table_id = aws_route_table.t-public-route-table.id
}
