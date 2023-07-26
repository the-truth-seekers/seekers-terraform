module "vpc_project" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0.0"

  name                    = format("vpc_%s", var.PROJECT_NAME)
  cidr                    = "10.0.0.0/23"
  azs                     = ["us-east-1a"]
  public_subnets          = ["10.0.0.0/24"]
  map_public_ip_on_launch = true

  tags = {
    Project = format("vpc-%s", var.PROJECT_NAME)
  }
}