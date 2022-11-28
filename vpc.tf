resource "aws_vpc" "schiele" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "Schiele VPC"
  }
}

resource "aws_subnet" "sch-public1" {
  vpc_id     = aws_vpc.schiele.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "Schiele public subnet 1"
  }
}

resource "aws_subnet" "sch-public2" {
  vpc_id     = aws_vpc.schiele.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-central-1b"
  tags = {
    Name = "Schiele public subnet 2"
  }
}

resource "aws_subnet" "sch-private1" {
  vpc_id     = aws_vpc.schiele.id
  cidr_block = "10.0.8.0/24"
  availability_zone = "eu-central-1b"
  tags = {
    Name = "Schiele private subnet 1"
  }
}

resource "aws_subnet" "sch-private2" {
  vpc_id     = aws_vpc.schiele.id
  cidr_block = "10.0.9.0/24"
  availability_zone = "eu-central-1c"
  tags = {
    Name = "Schiele private subnet 2"
  }
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "subnet_group"
  subnet_ids = [aws_subnet.sch-private1.id, aws_subnet.sch-private2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.schiele.id
   tags = {
    Name = "Schiele internet gateway"
  }
}

# resource "aws_nat_gateway" "sch_nat" {
#   allocation_id = aws_eip.sch_nat.id
#   subnet_id     = aws_subnet.sch-public1.id

#   tags = {
#     Name = "NAT Gateway"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.gw]
# }

resource "aws_route_table" "sch_route_table" {
  vpc_id = aws_vpc.schiele.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

}

resource "aws_route_table_association" "rta_subnet_public1" {
  subnet_id      = aws_subnet.sch-public1.id
  route_table_id = aws_route_table.sch_route_table.id
}

resource "aws_route_table_association" "rta_subnet_public2" {
  subnet_id      = aws_subnet.sch-public2.id
  route_table_id = aws_route_table.sch_route_table.id
}
