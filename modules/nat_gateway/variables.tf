variable "elastic_ip_id" {
  description = "Elastic IP ID for NAT Gateway"
}

variable "subnet_id" {
  description = "ID of the subnet to place the NAT Gateway"
}

variable "nat_name" {
  description = "Name for the NAT Gateway"
  default     = "NAT-Gateway"
}
