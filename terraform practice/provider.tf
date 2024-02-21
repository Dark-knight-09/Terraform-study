terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.9.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.Access-Key
  secret_key = var.Secret-Key
}