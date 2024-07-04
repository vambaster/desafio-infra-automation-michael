output "instance_ids" {
  description = "IDs of the created instances"
  value       = aws_instance.web[*].id
}

output "instance_public_ips" {
  description = "Public IPs of the created instances"
  value       = aws_instance.web[*].public_ip
}