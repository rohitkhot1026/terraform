resource "aws_vpc" "demo" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
#    Name = "created by terraform"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = "${aws_vpc.demo.id}"
  cidr_block        = var.public_subnet_cidr_blocks
  availability_zone = var.az_pub
  tags = {
    Name = var.public_subnet_name
#    Name = "created by terraform"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = "${aws_vpc.demo.id}"
  cidr_block        = var.private_subnet_cidr_blocks
  availability_zone = var.az_prv 
  tags = {
    Name = var.private_subnet_name
#    Name = "created by terraform"
  }
}

resource "aws_internet_gateway" "test-igw" {
  vpc_id = "${aws_vpc.demo.id}"


  tags = {
    Name = var.igw_name
#    Name = "created by terraform"
  }
}

resource "aws_route_table" "test-routeTable" {
  vpc_id = "${aws_vpc.demo.id}"


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.test-igw.id}"
  }

  tags = {
    Name = var.routeTable_name
#    Name = "created by terraform"
  }
}

resource "aws_route_table_association" "associate" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.test-routeTable.id}"
}

resource "aws_eip" "ip" {
  vpc      = true
  tags = {
    Name = var.elasticIP_name
#    Name = "created by terraform"
  }
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = "${aws_eip.ip.id}"
  subnet_id     = "${aws_subnet.public_subnet.id}"


  tags = {
    Name = var.nat_gateway_name
#    Name = "created by terraform"
  }
}

resource "aws_route_table" "test-routeTable-1" {
  vpc_id = "${aws_vpc.demo.id}"


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat-gateway.id}"
  }

  tags = {
    Name = var.routeTable_name_1
#    Name = "created by terraform"
  }
}

 resource "aws_route_table_association" "associate1" {
  subnet_id      = "${aws_subnet.private_subnet.id}"
  route_table_id = "${aws_route_table.test-routeTable-1.id}"
}
