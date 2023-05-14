resource "azurerm_resource_group" "rg_database" {
  name     = format("azrg-%s", var.PROJECT_NAME)
  location = var.AZ_REGION
}

# resource "azurerm_storage_account" "sa_database" {
#     name                     = format("azsa%s", var.PROJECT_NAME)
#     resource_group_name      = azurerm_resource_group.rg_database.name
#     location                 = azurerm_resource_group.rg_database.location
#     account_tier             = "Standard"
#     account_replication_type = "LRS"
# }

resource "azurerm_mssql_server" "server_database" {
  name                         = format("azsdb-%s", var.PROJECT_NAME)
  resource_group_name          = azurerm_resource_group.rg_database.name
  location                     = var.AZ_REGION
  version                      = "12.0"
  administrator_login          = var.AZURE_SERVER_DATABASE_USER
  administrator_login_password = var.AZURE_SERVER_DATABASE_PASSWORD
  minimum_tls_version          = "1.2"
}

resource "azurerm_mssql_database" "mssql_database" {
  name                        = format("azdb-%s", var.PROJECT_NAME)
  server_id                   = azurerm_mssql_server.server_database.id
  collation                   = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb                 = 1
  read_scale                  = false
  sku_name                    = "GP_S_Gen5_1"
  zone_redundant              = false
  min_capacity                = 0.5
  auto_pause_delay_in_minutes = 60
  storage_account_type        = "Local"
}