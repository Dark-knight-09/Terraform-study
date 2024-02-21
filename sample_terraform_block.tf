// initialize the terraform provider
terraform{
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "3.0.0"
        }
    }
}

// configure the aws provider
provider "aws" {
    region = "us-west-2"
    access_key = ""
    secret_key = ""
}

// Data block
data "aws_ami" "example" {
    most_recent = true

    filter {
        name   = "name"
        values = ["amzn-ami*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["amazon"]
}

// display the output of the data block
output "ami_id" {
    value = data.aws_ami.example.id
}

// Count 
resource "aws_instance" "example" {
    count= 3
    ami           = data.aws_ami.example.id
    instance_type = "t2.micro"
    tags= {
        Name= "instance-${count.index}"
    }
}


// For_each
resource "aws_subnet" "example"{
    for_each = {
      subnet_1 = "1"
        subnet_2 = "2" 
    }
    vpc_id = data.aws_vpc.example.id
    cidr_block = cidrsubnet(data.aws_vpc.example.cidr_block,8,each.value)
    tags = {
        Name = "subnet-${each.key}"
    }
}

