# # 5. Associate subnet with Route Table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-pub.id
  route_table_id = aws_route_table.project-ig-route-table.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet-priv.id
  route_table_id = aws_route_table.project-nat-route-table.id
}