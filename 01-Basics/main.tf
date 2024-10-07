terraform {
  required_providers {
    # Require the 'azurerm' (Azure Resource Manager) provider
    azurerm = {
      source  = "hashicorp/azurerm" # full source = https://registry.terraform.io/providers/hashicorp/azurerm/
      version = "~> 3.116"          # meaning Version 3.116 or higher but NOT versions 4.x
    }
  }

  # Require Terraform Version 1.6.0 or higher
  required_version = ">= 1.6.0"
}

provider "azurerm" {
  features {
    # Allows you to override default Azure behaviour
    # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block
  }
}

# Create a first resource group (with very static properties)
resource "azurerm_resource_group" "training_rg_one" {
  name     = "rg-tftraining-one"
  location = "northeurope"
  tags = {
    Environment = "Demo"
    Project     = "Terraform Training"
  }
}

# Using variables to create a second resource group
resource "azurerm_resource_group" "training_rg_two" {
  name     = "rg-tftraining-two"
  location = var.default_location
  tags     = var.default_tags
}

# Using count to create multiple resources having similar properties: https://developer.hashicorp.com/terraform/language/meta-arguments/count
resource "azurerm_resource_group" "training_rg_count" {
  count    = var.number_of_rg
  name     = "rg-tftraining-${count.index}"
  location = var.default_location
  tags     = var.default_tags
}

# Using for_each to create multiple resources having similar properties: https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
resource "azurerm_resource_group" "training_rg_foreach" {
  for_each = var.rg_by_location # for_each is using our map, which has a 'key' (e.g. 'first') and a value (e.g. 'northeurope')
  name     = "rg-tftraining-${each.key}"
  location = each.value
  tags     = var.default_tags
}
