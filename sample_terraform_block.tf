terraform{
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "3.0.0"
        }
    }
}

provider "aws" {
    region = "us-west-2"
    access_key = ""
    secret_key = ""
}

data "aws_ami" "example" {
    most_recent = true

    filter {
        name   = "name"
        values = ["amzn-ami-hvm-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["amazon"]
}