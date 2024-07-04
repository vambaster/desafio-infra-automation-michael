provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "projetos-terraform-status"
    key            = "Minsait/terraform.tfstate"
    region         = "us-east-1"
  }
}