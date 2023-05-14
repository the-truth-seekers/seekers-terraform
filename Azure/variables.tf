
variable "PROJECT_NAME" {
  default     = "seekers"
  type        = string
  sensitive   = false
  description = "Nome do projeto"
}

variable "AZ_REGION" {
  default     = "eastus"
  type        = string
  sensitive   = false
  description = "Região do projeto"
}

variable "AZURE_SERVER_DATABASE_USER" {
  # default     = "Urubu100"
  type        = string
  sensitive   = true
  description = "Senha para o servidor do banco de dados"
}

variable "AZURE_SERVER_DATABASE_PASSWORD" {
  # default     = "Urubu@100"
  type        = string
  sensitive   = true
  description = "Senha para o servidor do banco de dados"
}

