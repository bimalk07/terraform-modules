variable "vpc_id" {
  description = "VPC ID for route table"
}

variable "internet_gateway_id" {
  description = "ID of the internet gateway"
}

variable "route_table_name" {
  description = "Name of the route table"
  default     = "Public-Route-Table"
}
