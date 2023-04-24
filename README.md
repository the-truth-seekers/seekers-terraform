# seekers-terraform
Script terraform para provisionamento da infraestrutura do projeto na cloud AWS

## __Configurações necessárias__

Antes de começar a executar o terraform é necessário colocar as credenciais da aws na máquina de trabalho. Para os passos a seguir, é necessário ter o AWS CLI instalado, assim como o terraform.

As credenciais se encontra na tela de start do laboratório. Inicialmente inicie o laboratório. Ao clicar no botão "AWS Details", abrirá uma tela ao lado do terminal escrito "Cloud Access" e logo abaixo, "AWS CLI:" com um botão ao lado. Clique no botão botão, e aparecerá as credenciais da sessão e então as copie. 

Lembre-se que cada sessão dura 4 horas, e é necessário renovar a seesão e as credenciais para continuar usando após esse período.

Ao copiar as credenciais, crie o arquivo "credencials" no diretório ~/.aws, resultando assim:

- ~/.aws/credentials

## __Comandos básicos e necessários para execução dos scripts__

### terraform init

O terraform init faz o download dos provedores e suas versões, configurados no arquivo main.tf, e prepara o diretório para o uso do terraform

### terraform plan

O terraform plan cria um plano de execução, que consiste em: 
- Ler o estado atual de qualquer objeto remoto já existente para garantir que o estado do Terraform esteja atualizado.
- Comparando a configuração atual com o estado anterior e observando quaisquer diferenças.
- Propor um conjunto de ações de mudança que devem, se aplicadas, fazer com que os objetos remotos correspondam à configuração.

### terraform apply

Aplica o plano de execução no ambiente da AWS

### terraform destroy

Remove todos os recursos provisionados pelo terraform no ambiente


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.53.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.53.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_database.mssql_database](https://registry.terraform.io/providers/hashicorp/azurerm/3.53.0/docs/resources/mssql_database) | resource |
| [azurerm_mssql_server.server_database](https://registry.terraform.io/providers/hashicorp/azurerm/3.53.0/docs/resources/mssql_server) | resource |
| [azurerm_resource_group.rg_database](https://registry.terraform.io/providers/hashicorp/azurerm/3.53.0/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AZURE_SERVER_DATABASE_PASSWORD"></a> [AZURE\_SERVER\_DATABASE\_PASSWORD](#input\_AZURE\_SERVER\_DATABASE\_PASSWORD) | Senha para o servidor do banco de dados | `string` | `"Urubu@100"` | no |
| <a name="input_AZURE_SERVER_DATABASE_USER"></a> [AZURE\_SERVER\_DATABASE\_USER](#input\_AZURE\_SERVER\_DATABASE\_USER) | Senha para o servidor do banco de dados | `string` | `"Urubu100"` | no |
| <a name="input_AZ_REGION"></a> [AZ\_REGION](#input\_AZ\_REGION) | Região do projeto | `string` | `"eastus"` | no |
| <a name="input_PROJECT_NAME"></a> [PROJECT\_NAME](#input\_PROJECT\_NAME) | Nome do projeto | `string` | `"seekers"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->