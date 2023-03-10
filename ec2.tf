# WEB_SERVER
resource "aws_instance" "web_server" {
  ami           = var.AMI_HASH
  key_name      = var.KEY_NAME
  instance_type = var.INSTANCE_TYPE_MICRO
  subnet_id     = aws_subnet.public_subnet.id
  vpc_security_group_ids = [
    aws_security_group.http-https.id,
    aws_security_group.ssh.id,
    aws_default_security_group.default.id
  ]

  user_data = file("configuracoes/configure.sh")

  tags = {
    Name = "web-server"
  }
}

resource "aws_eip" "web_server" {
  instance = aws_instance.web_server.id
  vpc      = true

  tags = {
    Name = "web-server"
  }
}

# PROCESSAMENTO
resource "aws_instance" "processamento" {
  ami           = var.AMI_HASH
  instance_type = var.INSTANCE_TYPE_LARGE
  key_name      = var.KEY_NAME
  subnet_id     = aws_subnet.private_subnet.id
  vpc_security_group_ids = [
    aws_security_group.http-https.id,
    aws_security_group.ssh.id,
    aws_default_security_group.default.id
  ]

  user_data = file("configuracoes/configure-jupyter.sh")

  tags = {
    Name = "processamento"
  }
}

resource "aws_eip" "processamento" {
  instance = aws_instance.processamento.id
  vpc      = true

  tags = {
    Name = "processamento"
  }
}

# DATABASE
resource "aws_instance" "database" {
  ami           = var.AMI_HASH
  instance_type = var.INSTANCE_TYPE_MICRO
  key_name      = var.KEY_NAME
  subnet_id     = aws_subnet.private_subnet.id
  vpc_security_group_ids = [
    aws_security_group.database.id,
    aws_security_group.ssh.id,
    aws_default_security_group.default.id
  ]

  user_data = file("configuracoes/configure-database.sh")

  tags = {
    Name = "database"
  }
}

resource "aws_eip" "database" {
  instance = aws_instance.database.id
  vpc      = true

  tags = {
    Name = "database"
  }
}
