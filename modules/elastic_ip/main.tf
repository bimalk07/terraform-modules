resource "aws_eip" "main" {
  domain = "vpc"

  tags = {
    Name = var.elastic_ip_name
  }
}
