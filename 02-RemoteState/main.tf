module "backend_naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.1"
  suffix  = ["training"]
}

resource "azurerm_resource_group" "backend_rg" {
  name     = "${module.backend_naming.resource_group.name}-shared"
  location = var.default_location
  tags     = var.default_tags
}

# Create an Azure storage account
resource "azurerm_storage_account" "backend_storage" {
  name                = module.backend_naming.storage_account.name_unique
  location            = var.default_location
  resource_group_name = azurerm_resource_group.backend_rg.name
  tags                = var.default_tags

  account_tier             = "Standard"
  account_replication_type = "GRS"
}

# Create a Blob container for our Terraform remote state
# This container should be named 'tfstate' by convention
resource "azurerm_storage_container" "backend_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.backend_storage.name
  container_access_type = "private"
}
