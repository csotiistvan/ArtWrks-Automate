resource "aws_vpc" "schiele" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "Schiele VPC"
  }
}

resource "aws_subnet" "sch-public" {
  vpc_id     = aws_vpc.schiele.id
  cidr_block = "10.0.1.0/24"
#  availability_zone = "eu-cental-1a"
  tags = {
    Name = "Schiele public subnet"
  }
}

# resource "aws_subnet" "sch-private" {
#   vpc_id     = aws_vpc.schiele.id
#   cidr_block = "10.0.1.0/24"
#   availability_zone = "eu-cental-1"
#   tags = {
#     Name = "Schiele private subnet"
#   }
# }