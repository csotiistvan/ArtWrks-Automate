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
    Name = "Schiele public subnet"
  }
}

resource "aws_subnet" "sch-public2" {
  vpc_id     = aws_vpc.schiele.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-central-1b"
  tags = {
    Name = "Schiele public subnet"
  }
}

resource "aws_subnet" "sch-private1" {
  vpc_id     = aws_vpc.schiele.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-central-1c"
  tags = {
    Name = "Schiele private subnet"
  }
}

resource "aws_subnet" "sch-private2" {
  vpc_id     = aws_vpc.schiele.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-central-1c"
  tags = {
    Name = "Schiele private subnet"
  }
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "subnet_group"
  subnet_ids = [aws_subnet.sch-private1.id, aws_subnet.sch-private2.id]

  tags = {
    Name = "My DB subnet group"
  }
}