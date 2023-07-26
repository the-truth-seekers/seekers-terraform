module "sg_http_80" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "~> 5.0.0"

  name                = "http-80"
  description         = "HTTP"
  vpc_id              = module.vpc_project.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "sg_http_8080" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-8080"
  version = "~> 5.0.0"

  name                = "http-8080"
  description         = "HTTP"
  vpc_id              = module.vpc_project.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "sg_ssh" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 5.0.0"

  name                = "ssh"
  description         = "ssh"
  vpc_id              = module.vpc_project.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "sg_docker_swarm" {
  source  = "terraform-aws-modules/security-group/aws//modules/docker-swarm"
  version = "~> 5.0.0"

  name                = "swarm"
  description         = "docker-swarm"
  vpc_id              = module.vpc_project.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "sg_custom" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0.0"

  name        = "custom"
  description = "Apps gerais customizadas"
  vpc_id      = module.vpc_project.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 8000
      to_port     = 8000
      protocol    = "tcp"
      description = "Custom Port 8000"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 9000
      to_port     = 9000
      protocol    = "tcp"
      description = "Custom Port 9000"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}