terraform {
  backend "s3" {
    bucket         = "projetos-terraform-status"
    key            = "Minsait/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "nome-da-sua-tabela-dynamodb"
    encrypt        = true
  }
}