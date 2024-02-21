resource "aws_subnet" "example"{
    for_each = {
      subnet_1 = "1"
        subnet_2 = "2" 
    }
    vpc_id = data.aws_vpc.example.id
    cidr_block = cidrsubnet(data.aws_vpc.example.cidr_block,8,each.value)

}

data "aws_vpc" "example" {
    default = true
}

output "subnet_id" {
    value = data.aws_vpc.example.cidr_block
}

