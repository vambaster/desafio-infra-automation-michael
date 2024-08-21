provider "aws" {
  region = "us-east-1"  # Substitua pela região desejada
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")  # Substitua pelo caminho da sua chave pública
}

resource "aws_security_group" "docker_sg" {
  name        = "docker-sg"
  description = "Security group for Docker hosts"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "docker_vm" {
  count         = 10  # Número de instâncias a serem criadas
  ami           = "ami-0c55b159cbfafe1f0"  # Substitua pela AMI desejada
  instance_type = "t2.micro"  # Substitua pelo tipo de instância desejado

  key_name      = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.docker_sg.name]

  tags = {
    Name = "docker-vm-${count.index + 1}"
  }

  # User data script para configurar Docker ao iniciar
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y yum-utils
              yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
              yum install -y docker-ce docker-ce-cli containerd.io
              systemctl enable docker
              systemctl start docker
              usermod -aG docker ec2-user
              EOF
}

output "instance_ips" {
  description = "Endereços IP das instâncias Docker"
  value       = aws_instance.docker_vm[*].public_ip
}
