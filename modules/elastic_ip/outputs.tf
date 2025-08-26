output "elastic_ip_id" {
  description = "ID of the Elastic IP"
  value       = aws_eip.main.id
}
