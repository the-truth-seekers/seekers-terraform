<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.9.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_project1"></a> [ec2\_project1](#module\_ec2\_project1) | terraform-aws-modules/ec2-instance/aws | ~> 5.1.0 |
| <a name="module_ec2_project2"></a> [ec2\_project2](#module\_ec2\_project2) | terraform-aws-modules/ec2-instance/aws | ~> 5.1.0 |
| <a name="module_ec2_project3"></a> [ec2\_project3](#module\_ec2\_project3) | terraform-aws-modules/ec2-instance/aws | ~> 5.1.0 |
| <a name="module_sg_custom"></a> [sg\_custom](#module\_sg\_custom) | terraform-aws-modules/security-group/aws | ~> 5.0.0 |
| <a name="module_sg_docker_swarm"></a> [sg\_docker\_swarm](#module\_sg\_docker\_swarm) | terraform-aws-modules/security-group/aws//modules/docker-swarm | ~> 5.0.0 |
| <a name="module_sg_http_80"></a> [sg\_http\_80](#module\_sg\_http\_80) | terraform-aws-modules/security-group/aws//modules/http-80 | ~> 5.0.0 |
| <a name="module_sg_http_8080"></a> [sg\_http\_8080](#module\_sg\_http\_8080) | terraform-aws-modules/security-group/aws//modules/http-8080 | ~> 5.0.0 |
| <a name="module_sg_ssh"></a> [sg\_ssh](#module\_sg\_ssh) | terraform-aws-modules/security-group/aws//modules/ssh | ~> 5.0.0 |
| <a name="module_vpc_project"></a> [vpc\_project](#module\_vpc\_project) | terraform-aws-modules/vpc/aws | ~> 5.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eip.eip1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.eip2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.eip3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_s3_bucket.bucket_project](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.bucket_pab_project](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [null_resource.instance1](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.instance2](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.instance3](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_ami.ami_ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AMI_SEERKERS"></a> [AMI\_SEERKERS](#input\_AMI\_SEERKERS) | Imagem ubuntu com docker instalado | `string` | `"ami-07fb8e747b0d1b3f4"` | no |
| <a name="input_AVAILABILITY_ZONE"></a> [AVAILABILITY\_ZONE](#input\_AVAILABILITY\_ZONE) | n/a | `string` | `"us-east-1a"` | no |
| <a name="input_BUCKET_NAME"></a> [BUCKET\_NAME](#input\_BUCKET\_NAME) | Nome do bucket | `string` | `"seekers-bucket"` | no |
| <a name="input_DNS_HOSTNAMES"></a> [DNS\_HOSTNAMES](#input\_DNS\_HOSTNAMES) | n/a | `bool` | `true` | no |
| <a name="input_DNS_SUPPORT"></a> [DNS\_SUPPORT](#input\_DNS\_SUPPORT) | n/a | `bool` | `true` | no |
| <a name="input_INSTANCE_TENANCY"></a> [INSTANCE\_TENANCY](#input\_INSTANCE\_TENANCY) | n/a | `string` | `"default"` | no |
| <a name="input_INSTANCE_TYPE_LARGE"></a> [INSTANCE\_TYPE\_LARGE](#input\_INSTANCE\_TYPE\_LARGE) | n/a | `string` | `"t3.large"` | no |
| <a name="input_INSTANCE_TYPE_MICRO"></a> [INSTANCE\_TYPE\_MICRO](#input\_INSTANCE\_TYPE\_MICRO) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_KEY_NAME"></a> [KEY\_NAME](#input\_KEY\_NAME) | Instâncias EC2 | `string` | `"seekers-tf"` | no |
| <a name="input_MAP_PUBLIC_IP"></a> [MAP\_PUBLIC\_IP](#input\_MAP\_PUBLIC\_IP) | n/a | `bool` | `true` | no |
| <a name="input_PRIVATES_CIDR_BLOCK"></a> [PRIVATES\_CIDR\_BLOCK](#input\_PRIVATES\_CIDR\_BLOCK) | n/a | `string` | `"10.0.1.0/24"` | no |
| <a name="input_PROJECT_NAME"></a> [PROJECT\_NAME](#input\_PROJECT\_NAME) | n/a | `string` | `"seekers"` | no |
| <a name="input_PUBLICS_CIDR_BLOCK"></a> [PUBLICS\_CIDR\_BLOCK](#input\_PUBLICS\_CIDR\_BLOCK) | Subnets | `string` | `"10.0.0.0/24"` | no |
| <a name="input_PUBLIC_DEST_CIDR_BLOCK"></a> [PUBLIC\_DEST\_CIDR\_BLOCK](#input\_PUBLIC\_DEST\_CIDR\_BLOCK) | Rota para o Internet Gateway | `string` | `"0.0.0.0/0"` | no |
| <a name="input_SG_CIDR_BLOCKS"></a> [SG\_CIDR\_BLOCKS](#input\_SG\_CIDR\_BLOCKS) | Security Group | `list` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_SG_IPV6_CIDR_BLOCKS"></a> [SG\_IPV6\_CIDR\_BLOCKS](#input\_SG\_IPV6\_CIDR\_BLOCKS) | n/a | `list` | <pre>[<br>  "::/0"<br>]</pre> | no |
| <a name="input_VPC_CIDR_BLOCK"></a> [VPC\_CIDR\_BLOCK](#input\_VPC\_CIDR\_BLOCK) | VPC | `string` | `"10.0.0.0/23"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip_instance1"></a> [ip\_instance1](#output\_ip\_instance1) | Ip público da máquina 1 (manager 1) |
| <a name="output_ip_instance2"></a> [ip\_instance2](#output\_ip\_instance2) | Ip público da máquina 2 (worker 1) |
| <a name="output_ip_instance3"></a> [ip\_instance3](#output\_ip\_instance3) | Ip público da máquina 3 (worker 2) |
<!-- END_TF_DOCS -->