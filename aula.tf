terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "3.74.0"
        }
    }
}

provider "aws" {
    #Configuration options
    region = "us-east-1"
    #access_key = 
    #secret_key = 
}

resource "aws_vpc" "vpc_brq" {
  cidr_block = "10.0.0.0/16"
  tags = {
      Name = "VPC_legal"
  }
}

# resource "aws_subnet" "subrede_brq" {
#   vpc_id     = aws_vpc.vpc_brq.id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "subrede_legal"
#   }
# }

resource "aws_internet_gateway" "gw_brq" {
  vpc_id = aws_vpc.vpc_brq.id

  tags = {
    Name = "Claudio"
  }
}

resource "aws_route_table" "rotas_brq" {
  vpc_id = aws_vpc.vpc_brq.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_brq.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.gw_brq.id
  }

  tags = {
    Name = "Joarez"
  }
}


# resource "aws_instance" "helloworld"{
#     ami = "ami-04505e74c0741db8d"
#    instance_type = "t2.micro"

#     tags = {
#         Name = "Robson"
#     }

# }