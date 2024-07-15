output "instance_ips" {
  value = aws_instance.docker_hosts.*.public_ip
}
