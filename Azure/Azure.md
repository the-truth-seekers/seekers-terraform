<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.56.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.56.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_database.mssql_database](https://registry.terraform.io/providers/hashicorp/azurerm/3.56.0/docs/resources/mssql_database) | resource |
| [azurerm_mssql_server.server_database](https://registry.terraform.io/providers/hashicorp/azurerm/3.56.0/docs/resources/mssql_server) | resource |
| [azurerm_resource_group.rg_database](https://registry.terraform.io/providers/hashicorp/azurerm/3.56.0/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AZURE_SERVER_DATABASE_PASSWORD"></a> [AZURE\_SERVER\_DATABASE\_PASSWORD](#input\_AZURE\_SERVER\_DATABASE\_PASSWORD) | Senha para o servidor do banco de dados | `string` | n/a | yes |
| <a name="input_AZURE_SERVER_DATABASE_USER"></a> [AZURE\_SERVER\_DATABASE\_USER](#input\_AZURE\_SERVER\_DATABASE\_USER) | Senha para o servidor do banco de dados | `string` | n/a | yes |
| <a name="input_AZ_REGION"></a> [AZ\_REGION](#input\_AZ\_REGION) | Região do projeto | `string` | `"eastus"` | no |
| <a name="input_PROJECT_NAME"></a> [PROJECT\_NAME](#input\_PROJECT\_NAME) | Nome do projeto | `string` | `"seekers"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->