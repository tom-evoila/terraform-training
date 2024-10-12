terraform {
  # This is an example backend configuration
  # modify this to match your storage account name
  backend "azurerm" {
    resource_group_name  = "rg-training-shared"     # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "sttrainingo3ck"         # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "02-RemoteState.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
    use_azuread_auth     = true                     # Can also be set via `ARM_USE_AZUREAD` environment variable.
  }
}
