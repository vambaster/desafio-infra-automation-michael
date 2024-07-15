variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-0c55b159cbfafe1f0" # AMI para Amazon Linux 2
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Nome do par de chaves"
  default     = "my-key-pair"
}

variable "private_key_path" {
  description = "Caminho para a chave privada usada para acessar as instâncias"
  default     = "~/.ssh/id_rsa"
}
