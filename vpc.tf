# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.VPC_CIDR_BLOCK
  instance_tenancy     = var.INSTANCE_TENANCY
  enable_dns_support   = var.DNS_SUPPORT
  enable_dns_hostnames = var.DNS_HOSTNAMES

  tags = {
    Name = format("vpc", var.PROJECT_NAME)
  }
}

# Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.PUBLICS_CIDR_BLOCK
  map_public_ip_on_launch = var.MAP_PUBLIC_IP
  availability_zone       = var.AVAILABILITY_ZONE

  tags = {
    Name = format("public-subnet", var.PROJECT_NAME)
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.PRIVATES_CIDR_BLOCK
  map_public_ip_on_launch = var.MAP_PUBLIC_IP
  availability_zone       = var.AVAILABILITY_ZONE

  tags = {
    Name = format("private-subnet", var.PROJECT_NAME)
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = format("internet-gateway", var.PROJECT_NAME)
  }
}

# Route Table
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = format("route-table", var.PROJECT_NAME)
  }
}

# Rota para o Internet Gateway
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.rtb.id
  destination_cidr_block = var.PUBLIC_DEST_CIDR_BLOCK
  gateway_id             = aws_internet_gateway.igw.id
}

# Associação da Route Table à subnet pública
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rtb.id
}

# Security Group
resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "SSH"

  vpc_id = aws_vpc.vpc.id

  ingress = [
    {
      description      = "ssh"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = var.SG_CIDR_BLOCKS
      ipv6_cidr_blocks = var.SG_IPV6_CIDR_BLOCKS
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "http-https" {
  name        = "http-https"
  description = "aplicacao"

  vpc_id = aws_vpc.vpc.id

  ingress = [
    {
      description      = "http"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = var.SG_CIDR_BLOCKS
      ipv6_cidr_blocks = var.SG_IPV6_CIDR_BLOCKS
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "https"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = var.SG_CIDR_BLOCKS
      ipv6_cidr_blocks = var.SG_IPV6_CIDR_BLOCKS
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "http-https"
  }
}

resource "aws_security_group" "database" {
  name        = "mysql-sg"
  description = "database"

  vpc_id = aws_vpc.vpc.id

  ingress = [
    {
      description      = "banco"
      from_port        = 3306
      to_port          = 3306
      protocol         = "tcp"
      cidr_blocks      = var.SG_CIDR_BLOCKS
      ipv6_cidr_blocks = var.SG_IPV6_CIDR_BLOCKS
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "mysql-sg"
  }
}

resource "aws_default_security_group" "default" {
  # name = "default"
  # description = "default"

  vpc_id = aws_vpc.vpc.id

  ingress = [
    {
      description      = "default"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = var.SG_CIDR_BLOCKS
      ipv6_cidr_blocks = var.SG_IPV6_CIDR_BLOCKS
      prefix_list_ids  = []
      security_groups  = []
      self             = true
    }
  ]

  egress = [
    {
      description      = "default"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = var.SG_CIDR_BLOCKS
      ipv6_cidr_blocks = var.SG_IPV6_CIDR_BLOCKS
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "default-sg"
  }
}
