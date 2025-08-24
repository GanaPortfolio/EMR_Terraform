resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = { Name = "emr_vpc"}
}



resource "aws_internet_gateway" "my_igwy" {
  vpc_id = aws_vpc.my_vpc.id
  tags = { Name = "emr_igwy"}
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = var.cidr_block
    gateway_id = aws_internet_gateway.my_igwy.id
  }
  tags = { Name = "emr_rt"}
}
