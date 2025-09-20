# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = { Name = "itca-igw" }
}

# Elastic IP for NAT
resource "aws_eip" "nat" {
  vpc = true
}

# NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id
  tags = { Name = "itca-nat" }
}

resource "aws_vpc" "main" {
  cidr_block           = "192.168.0.0/25"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "itca-vpc"
  }
}
