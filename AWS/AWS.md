<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_default_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/default_security_group) | resource |
| [aws_eip.processamento](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/eip) | resource |
| [aws_eip.web_server](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/eip) | resource |
| [aws_instance.processamento](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/instance) | resource |
| [aws_instance.web_server](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/instance) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/internet_gateway) | resource |
| [aws_main_route_table_association.rtb-assn](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/main_route_table_association) | resource |
| [aws_route.internet_access](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/route) | resource |
| [aws_route_table.rtb](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/route_table) | resource |
| [aws_route_table_association.public_association](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/route_table_association) | resource |
| [aws_s3_bucket.bucket_project](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.bucket_pab_project](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_security_group.database](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/security_group) | resource |
| [aws_security_group.http-https](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/security_group) | resource |
| [aws_security_group.ssh](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/security_group) | resource |
| [aws_subnet.private_subnet](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AMI_HASH"></a> [AMI\_HASH](#input\_AMI\_HASH) | Instâncias EC2 | `string` | `"ami-0557a15b87f6559cf"` | no |
| <a name="input_AVAILABILITY_ZONE"></a> [AVAILABILITY\_ZONE](#input\_AVAILABILITY\_ZONE) | n/a | `string` | `"us-east-1a"` | no |
| <a name="input_BUCKET_NAME"></a> [BUCKET\_NAME](#input\_BUCKET\_NAME) | Nome do bucket | `string` | `"seekers-bucket"` | no |
| <a name="input_DNS_HOSTNAMES"></a> [DNS\_HOSTNAMES](#input\_DNS\_HOSTNAMES) | n/a | `bool` | `true` | no |
| <a name="input_DNS_SUPPORT"></a> [DNS\_SUPPORT](#input\_DNS\_SUPPORT) | n/a | `bool` | `true` | no |
| <a name="input_INSTANCE_TENANCY"></a> [INSTANCE\_TENANCY](#input\_INSTANCE\_TENANCY) | n/a | `string` | `"default"` | no |
| <a name="input_INSTANCE_TYPE_LARGE"></a> [INSTANCE\_TYPE\_LARGE](#input\_INSTANCE\_TYPE\_LARGE) | n/a | `string` | `"t2.large"` | no |
| <a name="input_INSTANCE_TYPE_MICRO"></a> [INSTANCE\_TYPE\_MICRO](#input\_INSTANCE\_TYPE\_MICRO) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_KEY_NAME"></a> [KEY\_NAME](#input\_KEY\_NAME) | n/a | `string` | `"seekers-tf"` | no |
| <a name="input_MAP_PUBLIC_IP"></a> [MAP\_PUBLIC\_IP](#input\_MAP\_PUBLIC\_IP) | n/a | `bool` | `true` | no |
| <a name="input_PRIVATES_CIDR_BLOCK"></a> [PRIVATES\_CIDR\_BLOCK](#input\_PRIVATES\_CIDR\_BLOCK) | n/a | `string` | `"10.0.1.0/24"` | no |
| <a name="input_PROJECT_NAME"></a> [PROJECT\_NAME](#input\_PROJECT\_NAME) | n/a | `string` | `"seekers"` | no |
| <a name="input_PUBLICS_CIDR_BLOCK"></a> [PUBLICS\_CIDR\_BLOCK](#input\_PUBLICS\_CIDR\_BLOCK) | Subnets | `string` | `"10.0.0.0/24"` | no |
| <a name="input_PUBLIC_DEST_CIDR_BLOCK"></a> [PUBLIC\_DEST\_CIDR\_BLOCK](#input\_PUBLIC\_DEST\_CIDR\_BLOCK) | Rota para o Internet Gateway | `string` | `"0.0.0.0/0"` | no |
| <a name="input_SG_CIDR_BLOCKS"></a> [SG\_CIDR\_BLOCKS](#input\_SG\_CIDR\_BLOCKS) | Security Group | `list` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_SG_IPV6_CIDR_BLOCKS"></a> [SG\_IPV6\_CIDR\_BLOCKS](#input\_SG\_IPV6\_CIDR\_BLOCKS) | n/a | `list` | <pre>[<br>  "::/0"<br>]</pre> | no |
| <a name="input_VPC_CIDR_BLOCK"></a> [VPC\_CIDR\_BLOCK](#input\_VPC\_CIDR\_BLOCK) | VPC | `string` | `"10.0.0.0/23"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->