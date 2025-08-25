# VPC
variable "vpc_cidr" {
  description = "CIDR block of VPC"
}

variable "vpc_tenancy" {
  description = "Instance tenancy of VPC"
}

variable "vpc_name" {
  description = "Name of VPC"
}

# Subnet
variable "subnet_cidr" {
  description = "CIDR block of subnet"
}

variable "subnet_zone" {
  description = "Availability zone of subnet"
}

variable "subnet_name" {
  description = "Name of subnet"
}
