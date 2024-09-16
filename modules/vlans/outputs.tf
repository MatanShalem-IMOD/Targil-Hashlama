
output "encryption_vnet_name" {
  value = azurerm_virtual_network.create_encryption_vnet.name 
}
output "encryption_subnet_name" {
  value = azurerm_subnet.create_encryption_vnet.subnet[0].name 
}
output "encryption_resource_group_name" {
  value = azurerm_resource_group.create_encryption_resource_group.name 
}
output "encryption_vnet_ip" {
  value = azurerm_virtual_network.create_encryption_vnet.subnet[0].address_prefixes[0]
}