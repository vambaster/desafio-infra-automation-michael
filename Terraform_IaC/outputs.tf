output "instance_ids" {
  description = "IDs das instâncias criadas"
  value       = aws_instance.web[*].id
}

output "instance_public_ips" {
  description = "IPs públicos das instâncias criadas"
  value       = aws_instance.web[*].public_ip
}