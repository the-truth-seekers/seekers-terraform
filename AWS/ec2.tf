data "aws_ami" "ami_ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

variable "AMI_SEERKERS" {
  default     = "ami-012d1d3215b6853d7"
  description = "Imagem ubuntu com docker instalado"
}

module "ec2_project1" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.1.0"

  name          = "cluster-manager-01"
  ami           = var.AMI_SEERKERS
  key_name      = var.KEY_NAME
  instance_type = var.INSTANCE_TYPE_LARGE
  subnet_id     = element(module.vpc_project.public_subnets, 0)

  vpc_security_group_ids = [
    module.sg_ssh.security_group_id,
    module.sg_custom.security_group_id,
    module.sg_http_80.security_group_id,
    module.sg_http_8080.security_group_id,
    module.sg_docker_swarm.security_group_id,
    module.vpc_project.default_security_group_id
  ]

  ebs_block_device = [
    {
      device_name = "/dev/sda1"
      volume_size = 20
      volume_type = "gp2"
    }
  ]

  tags = {
    "ClusterNodeType" = "manager",
    "NumberNodeType"  = 01
  }
}

resource "aws_eip" "eip1" {
  instance = module.ec2_project1.id
  domain   = "vpc"

  tags = {
    Name = "cluster-manager-02"
  }
}

module "ec2_project2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.1.0"

  depends_on    = [module.ec2_project1]
  name          = "cluster-worker-01"
  ami           = var.AMI_SEERKERS
  key_name      = var.KEY_NAME
  instance_type = var.INSTANCE_TYPE_LARGE
  subnet_id     = element(module.vpc_project.public_subnets, 0)

  vpc_security_group_ids = [
    module.sg_ssh.security_group_id,
    module.sg_custom.security_group_id,
    module.sg_http_80.security_group_id,
    module.sg_http_8080.security_group_id,
    module.sg_docker_swarm.security_group_id,
    module.vpc_project.default_security_group_id
  ]

  ebs_block_device = [
    {
      device_name = "/dev/sda1"
      volume_size = 20
      volume_type = "gp2"
    }
  ]

  tags = {
    "ClusterNodeType" = "worker",
    "NumberNodeType"  = 01
  }
}

resource "aws_eip" "eip2" {
  instance = module.ec2_project2.id
  domain   = "vpc"

  tags = {
    Name = "cluster-worker-01"
  }
}

module "ec2_project3" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.1.0"

  depends_on    = [module.ec2_project2]
  name          = "cluster-worker-02"
  ami           = var.AMI_SEERKERS
  key_name      = var.KEY_NAME
  instance_type = var.INSTANCE_TYPE_LARGE
  subnet_id     = element(module.vpc_project.public_subnets, 0)

  vpc_security_group_ids = [
    module.sg_ssh.security_group_id,
    module.sg_custom.security_group_id,
    module.sg_http_80.security_group_id,
    module.sg_http_8080.security_group_id,
    module.sg_docker_swarm.security_group_id,
    module.vpc_project.default_security_group_id
  ]

  ebs_block_device = [
    {
      device_name = "/dev/sda1"
      volume_size = 20
      volume_type = "gp2"
    }
  ]

  tags = {
    "ClusterNodeType" = "worker",
    "NumberNodeType"  = 02
  }
}

resource "aws_eip" "eip3" {
  instance = module.ec2_project3.id
  domain   = "vpc"

  tags = {
    Name = "cluster-worker-02"
  }
}

output "ip_instance1" {
  description = "Ip público da máquina 1 (manager 1)"
  value       = aws_eip.eip1.public_ip
}

output "ip_instance2" {
  description = "Ip público da máquina 2 (worker 1)"
  value       = aws_eip.eip2.public_ip
}

output "ip_instance3" {
  description = "Ip público da máquina 3 (worker 2)"
  value       = aws_eip.eip3.public_ip
}