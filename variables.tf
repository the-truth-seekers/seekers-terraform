variable "PROJECT_NAME" {
  default = "seekers"
}

variable "AVAILABILITY_ZONE" {
  default = "us-east-1a"
}


# Instâncias EC2
variable "AMI_HASH" {
  default = "ami-0557a15b87f6559cf"
}

variable "KEY_NAME" {
  default = "seekers-tf"
}

variable "INSTANCE_TYPE_MICRO" {
  default = "t2.micro"
}

variable "INSTANCE_TYPE_LARGE" {
  default = "t2.large"
}


# VPC
variable "VPC_CIDR_BLOCK" {
  default = "10.0.0.0/23"
}

variable "INSTANCE_TENANCY" {
  default = "default"
}

variable "DNS_SUPPORT" {
  default = true
}

variable "DNS_HOSTNAMES" {
  default = true
}

variable "MAP_PUBLIC_IP" {
  default = true
}


# Subnets
variable "PUBLICS_CIDR_BLOCK" {
  default = "10.0.0.0/24"
}

variable "PRIVATES_CIDR_BLOCK" {
  default = "10.0.1.0/24"
}


# Rota para o Internet Gateway
variable "PUBLIC_DEST_CIDR_BLOCK" {
  default = "0.0.0.0/0"
}

# Security Group
variable "SG_CIDR_BLOCKS" {
  default = ["0.0.0.0/0"]
}

variable "SG_IPV6_CIDR_BLOCKS" {
  default = ["::/0"]
}

# Bucket S3
variable "BUCKET_NAME" {
  type        = string
  description = "Nome do bucket"
  default     = "seekers-bucket"
}