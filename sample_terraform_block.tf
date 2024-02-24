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

// dyanmic Block
variable "ingress_rules" {
    description = "List of ingress rules"
    type = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
    }))
    default = [
        {
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
}

resource "aws_security_group" "example" {
    name = "example"

    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
            from_port   = ingress.value["from_port"]
            to_port     = ingress.value["to_port"]
            protocol    = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
        }
    }
}

// provisioner execution on aws_instance
resource "aws_instance" "example" {
    ami           = "ami-0c94855ba95c574c8"  # Update this with your AMI ID
    instance_type = "t2.micro"

    key_name = aws_key_pair.example.key_name

    provisioner "remote-exec" {
        inline = [
            "sudo apt-get update",
            "sudo apt-get install -y mysql-server",
        ]
    }

    provisioner "file" {
        source      = "localfile.txt"
        destination = "/tmp/remote_file.txt"
    }

    connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("~/.ssh/id_rsa")
        host        = self.public_ip
    }
}

resource "aws_key_pair" "example" {
    key_name   = "example"
    public_key = file("~/.ssh/id_rsa.pub")
}


//modeule block
module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "2.66.0"
    name = "my-vpc"
    cidr = "10.0.0.0/16"
}

output "vpc_id" {
    value = module.vpc.vpc_id
}
