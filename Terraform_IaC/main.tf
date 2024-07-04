provider "aws" {
  region = "us-east-1"  # Altere para a região desejada
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("ssh_keys/deployer-key.pub")
}

resource "aws_instance" "web" {
  count         = 10
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "Minsait_${count.index}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable'",
      "sudo apt-get update",
      "sudo apt-get install -y docker-ce",
      "sudo systemctl enable docker",
      "sudo systemctl start docker",
      "docker --version"  # Verifica se o Docker foi instalado
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }

    on_failure = "continue"  # Continua mesmo que ocorra um erro na instalação
  }

  provisioner "local-exec" {
    command = "echo 'Instance ${self.public_ip}: Docker installed' >> docker_installation.log"

    when    = "destroy"
    on_failure = "continue"
  }
}