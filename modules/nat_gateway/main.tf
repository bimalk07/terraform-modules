resource "aws_nat_gateway" "main" {
  allocation_id = var.elastic_ip_id
  subnet_id     = var.subnet_id

  tags = {
    Name = var.nat_name
  }
}
