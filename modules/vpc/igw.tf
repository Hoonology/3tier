
# 인터넷 게이트웨이 ( 외부 인터넷에 연결하기 위함 )
resource "aws_internet_gateway" "my-IGW" {
  vpc_id = aws_vpc.tvpc.id
}