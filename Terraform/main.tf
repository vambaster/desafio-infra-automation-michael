provider "aws" {
  region     = "us-west-2"
  access_key = "${env.AWS_ACCESS_KEY_ID}" #Exemplo de access_key= 'AKIAIOSFODNN7EXAMPLE'
  secret_key = "${env.AWS_SECRET_ACCESS_KEY}" # Exemplo de secret_key= 'wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY'
}

resource "aws_instance" "docker_hosts" {
  count         = 10
  ami           = "ami-0c55b159cbfafe1f0" # Altere para a AMI desejada (essa é para Amazon Linux 2)
  instance_type = "t2.micro"

  tags = {
    Name = "docker-vm-${count.index + 1}"
  }

  key_name = var.key_name # Substitua pelo seu par de chaves
  
  #execução feita pelo user_data na inicialização das ec2, evitando erros recorrentes do remote_exec
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y yum-utils
              sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
              sudo yum install -y docker-ce docker-ce-cli containerd.io
              sudo usermod -aG docker ec2-user
              sudo systemctl enable docker
              sudo systemctl start docker
              EOF

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }
}
