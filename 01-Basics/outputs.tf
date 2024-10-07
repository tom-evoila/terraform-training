output "resource_group_1_id" {
  value       = azurerm_resource_group.training_rg_one.id
  description = "The ID of our first training resource group."
}

output "resource_group_2_id" {
  value       = azurerm_resource_group.training_rg_two.id
  description = "The ID of our second training resource group."
}
