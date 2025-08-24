resource "aws_subnet" "my_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.subnet_cidr
  availability_zone = var.subnet_az
  map_public_ip_on_launch = true
  tags = { Name = "emr_subnet"}
}
resource "aws_route_table_association" "rt_asoc" {
  route_table_id = var.route_table_id
  subnet_id = aws_subnet.my_subnet.id
}